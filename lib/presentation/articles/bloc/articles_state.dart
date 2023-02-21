import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_state.freezed.dart';

@freezed
class ArticleState extends BaseBlocState with _$ArticleState {
  const factory ArticleState({
    @Default([]) List<Article> articles,
  }) = _ArticleState;
}
