import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'data_response.freezed.dart';
part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  DataResponse({
    @JsonKey(name: 'result') this.result,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) =>
      _$DataResponseFromJson(json, fromJsonT);

  final T? result;
}

@JsonSerializable(genericArgumentFactories: true)
class DataListResponse<T> {
  DataListResponse({
    @JsonKey(name: 'result') this.result,
  });

  factory DataListResponse.fromJson(
    MapJson json,
    T Function(dynamic) fromJsonT,
  ) =>
      _$DataListResponseFromJson(json, fromJsonT);

  final List<T>? result;
}
