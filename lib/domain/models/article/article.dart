import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';

@freezed
class Article with _$Article {
  const factory Article({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String body,
  }) = _Article;
}
