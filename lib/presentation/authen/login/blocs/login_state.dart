import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  // const LoginState({
  //   this.userName = '',
  //   this.password = '',
  // });

  // final String userName;
  // final String password;

  // @override
  // List<Object?> get props => [userName, password];
  const factory LoginState({
    @Default('') String username,
    @Default('') String password,
  }) = _LoginState;
}
