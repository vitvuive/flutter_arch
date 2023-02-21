import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_data/map_json.dart';

part 'article_data.freezed.dart';
part 'article_data.g.dart';

@freezed
class ArticleData with _$ArticleData {
  const factory ArticleData({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String body,
  }) = _ArticleData;

  factory ArticleData.fromJson(MapJson json) => _$ArticleDataFromJson(json);
}
