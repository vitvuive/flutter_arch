part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class InputUserNameEvent extends LoginEvent {
  const InputUserNameEvent(this.name);
  final String name;

  @override
  List<Object?> get props => [name];
}

class InputPasswordEvent extends LoginEvent {
  const InputPasswordEvent(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

class SubmitUserNameEvent extends LoginEvent {}
