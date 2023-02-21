import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_data/map_json.dart';

part 'register_data.freezed.dart';
part 'register_data.g.dart';

@freezed
class RegisterData with _$RegisterData {
  const factory RegisterData({
    @Default(false) bool success,
  }) = _RegisterData;

  factory RegisterData.fromJson(MapJson json) => _$RegisterDataFromJson(json);
}
