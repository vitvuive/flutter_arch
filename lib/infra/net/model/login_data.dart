import 'package:ddd_arch/infra/net/model/base_data/map_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @Default(false) bool success,
    ResultLoginData? result,
    String? token,
  }) = _LoginData;

  factory LoginData.fromJson(MapJson json) => _$LoginDataFromJson(json);
}

@freezed
class ResultLoginData with _$ResultLoginData {
  const factory ResultLoginData({
    int? id,
    String? name,
    String? phone,
    String? email,
  }) = _ResultLoginData;

  factory ResultLoginData.fromJson(MapJson json) =>
      _$ResultLoginDataFromJson(json);
}
