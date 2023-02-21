import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState extends BaseBlocState with _$RegisterState {
  const factory RegisterState() = _RegisterState;
}
