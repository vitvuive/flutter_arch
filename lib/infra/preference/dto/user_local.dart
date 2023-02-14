import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_local.freezed.dart';
part 'user_local.g.dart';

@JsonSerializable()
@freezed
class UserLocal with _$UserLocal {
  const factory UserLocal({
    @JsonKey(name: 'user_name') required String userName,
    @JsonKey(name: 'password') required String password,
  }) = _UserLocal;

  factory UserLocal.fromJson(MapJson json) => _$UserLocalFromJson(json);
}
