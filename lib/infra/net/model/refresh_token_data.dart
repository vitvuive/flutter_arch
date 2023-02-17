import 'package:ddd_arch/infra/net/model/base_data/map_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_data.freezed.dart';
part 'refresh_token_data.g.dart';

@freezed
class RefreshTokenData with _$RefreshTokenData {
  const factory RefreshTokenData({
    @JsonKey(name: 'access_token') String? accessToken,
  }) = _RefreshTokenData;

  factory RefreshTokenData.fromJson(MapJson json) =>
      _$RefreshTokenDataFromJson(json);
}
