import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/navigation/app_navigator.dart';
import 'package:ddd_arch/app/navigation_impl.dart';
import 'package:ddd_arch/application/auth_service.dart';
import 'package:ddd_arch/application/profile_service.dart';
import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:ddd_arch/presentation/home/blocs/home_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.authService,
    this.profileService,
    this.navigator,
  ) : super(const HomeState()) {
    on<RequestSubcribeState>(_requestSubcribe);
    on<UpdateUserProfile>(_updateUserProfile);
    on<LogoutEvent>(_logoutEvent);
  }

  final AuthService authService;
  final ProfileService profileService;
  final AppNavigator navigator;

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
