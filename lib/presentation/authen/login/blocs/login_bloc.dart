import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/core/navigation/app_navigator.dart';
import 'package:ddd_arch/presentation/authen/login/blocs/login_state.dart';
import 'package:ddd_arch/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_event.dart';
// part 'login_state.dart';

@injectable
class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc(this.authService, this.appNavigator) : super(const LoginState()) {
    on<InputUserNameEvent>(_inputUserName);
    on<InputPasswordEvent>(_inputPassword);
    on<SubmitUserNameEvent>(_submit);
  }

  final AuthService authService;
  final AppNavigator appNavigator;

  final form = FormGroup({
    'email': FormControl<String>(
      value: '',
      validators: [Validators.email],
    ),
    'password': FormControl<String>(
      value: '',
      validators: [
        Validators.required,
        Validators.minLength(6),
      ],
    ),
  });

  Future<void> _inputUserName(
    InputUserNameEvent event,
    Emitter<LoginState> emit,
  ) async {
    // emit(
    //   state.copyWith(
    //     username: event.name,
    //   ),
    // );
  }

  Future<void> _inputPassword(
    InputPasswordEvent event,
    Emitter<LoginState> emit,
  ) async {
    // emit(
    //   state.copyWith(
    //     password: event.password,
    //   ),
    // );
  }

  Future<void> _submit(
    SubmitUserNameEvent event,
    Emitter<LoginState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        if (form.valid) {
          final email = form.control('email').value as String;
          final password = form.control('password').value as String;
          final result = await authService.login(
            username: email,
            password: password,
          );

          if (result) {
            navigator.showSnackBar('Login success');
            await navigator.replaceAllNamed(Routes.home);
          }
        }
      },
    );
  }
}
