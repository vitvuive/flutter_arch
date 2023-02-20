import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState extends BaseBlocState with _$SplashState {
  const factory SplashState({@Default(AuthState.unknown) AuthState authState}) =
      _SplashState;
}

enum AuthState { unknown, authenticated, unAuthenticated }
