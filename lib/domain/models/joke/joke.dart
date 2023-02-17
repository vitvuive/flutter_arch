import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke.freezed.dart';
part 'joke.g.dart';

@freezed
class JokeListModel with _$JokeListModel {
  const factory JokeListModel({
    List<JokeModel>? jokes,
  }) = _JokeListModel;

  factory JokeListModel.fromJson(Map<String, Object?> json) =>
      _$JokeListModelFromJson(json);
}

@freezed
class JokeModel with _$JokeModel {
  const factory JokeModel({
    String? type,
    String? setup,
    String? punchline,
    int? id,
  }) = _JokeModel;

  factory JokeModel.fromJson(Map<String, Object?> json) =>
      _$JokeModelFromJson(json);
}
