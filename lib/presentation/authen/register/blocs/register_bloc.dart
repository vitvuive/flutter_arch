import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/presentation/authen/register/blocs/register_event.dart';
import 'package:ddd_arch/presentation/authen/register/blocs/register_state.dart';
import 'package:ddd_arch/service/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.authService) : super(const RegisterState()) {
    on<SubmitRegisterEvent>(_submit);
  }

  final AuthService authService;

  final FormGroup form = FormGroup({
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

  Future<void> _submit(
    SubmitRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    await runBlocCatching(action: () async {
      if (form.valid) {
        final email = form.control('email').value as String;
        final password = form.control('password').value as String;
        final result =
            await authService.register(email: email, password: password);
        if (result) {
          navigator.showSnackBar('Register Success');
          await navigator.replaceAllNamed(Routes.login);
        }
      }
    });
  }
}
