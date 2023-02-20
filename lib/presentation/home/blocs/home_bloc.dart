import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:ddd_arch/presentation/home/blocs/home_state.dart';
import 'package:ddd_arch/service/auth_service.dart';
import 'package:ddd_arch/service/profile_service.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(
    this.authService,
    this.profileService,
  ) : super(const HomeState()) {
    on<RequestSubcribeState>(_requestSubcribe);
    on<UpdateUserProfile>(_updateUserProfile);
    on<LogoutEvent>(_logoutEvent);
  }

  final AuthService authService;
  final ProfileService profileService;

  Future<void> _requestSubcribe(
    RequestSubcribeState event,
    Emitter<HomeState> emit,
  ) async {
    await emit.forEach(
      authService.streamStatus,
      onData: (data) {
        add(UpdateUserProfile());
        return state.copyWith(authStatus: data);
      },
    );
  }

  Future<void> _updateUserProfile(
    UpdateUserProfile event,
    Emitter<HomeState> emit,
  ) async {
    if (state.authStatus == AuthStatus.authenticated) {
      final user = await profileService.getCurrentUser();
      emit(state.copyWith(user: user));
    }
  }

  Future<void> _logoutEvent(
    LogoutEvent event,
    Emitter<HomeState> emit,
  ) async {
    await authService.logout();
    await navigator.replaceAllNamed(Routes.home);
  }
}
