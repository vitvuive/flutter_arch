part of 'login_bloc.dart';

abstract class LoginEvent extends BaseBlocEvent {
  const LoginEvent();
}

class InputUserNameEvent extends LoginEvent {
  const InputUserNameEvent(this.name);
  final String name;
}

class InputPasswordEvent extends LoginEvent {
  const InputPasswordEvent(this.password);

  final String password;
}

class SubmitUserNameEvent extends LoginEvent {}
