import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/presentation/splash/bloc/splash_event.dart';
import 'package:ddd_arch/presentation/splash/bloc/splash_state.dart';
import 'package:ddd_arch/service/auth_service.dart';
import 'package:ddd_arch/service/profile_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc(this.profileService, this.authService)
      : super(const SplashState()) {
    on<RequestInitApp>(_requestInitApp);

    add(RequestInitApp());
  }

  final ProfileService profileService;
  final AuthService authService;

  Future<void> _requestInitApp(
    RequestInitApp event,
    Emitter<SplashState> emit,
  ) async {
    // final isLogin = await profileService.isLogin();
    final isAuthen = authService.isLogin;
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 2));
    // emit(
    //   state.copyWith(
    //     authState:
    //         isLogin ? AuthState.authenticated : AuthState.unAuthenticated,
    //   ),
    // );

    if (isAuthen) {
      await navigator.replaceAllNamed(Routes.home);
    } else {
      await navigator.replaceAllNamed(Routes.login);
    }
  }
}
