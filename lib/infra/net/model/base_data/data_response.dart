import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//part 'data_response.freezed.dart';
part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  DataResponse({
    @JsonKey(name: 'data') this.data,
  });

  factory DataResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$DataResponseFromJson(json, fromJsonT);

  final T? data;
}

@JsonSerializable(genericArgumentFactories: true)
class DataListResponse<T> {
  DataListResponse({
    @JsonKey(name: 'data') this.data,
  });

  factory DataListResponse.fromJson(
          MapJson json, T Function(dynamic) fromJsonT) =>
      _$DataListResponseFromJson(json, fromJsonT);

  final List<T>? data;
}
