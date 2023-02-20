import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:ddd_arch/domain/models/user/user.dart';
import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  const factory HomeState({
    @Default(AuthStatus.unAuthenticated) AuthStatus authStatus,
    User? user,
  }) = _HomeState;
}
