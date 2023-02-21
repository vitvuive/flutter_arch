import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState extends BaseBlocState with _$LoginState {
  const factory LoginState() = _LoginState;
}
