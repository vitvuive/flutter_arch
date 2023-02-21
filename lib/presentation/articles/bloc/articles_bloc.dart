import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/presentation/articles/bloc/articles_event.dart';
import 'package:ddd_arch/service/article_service.dart';
import 'package:injectable/injectable.dart';

import 'articles_state.dart';

@injectable
class ArticleBloc extends BaseBloc<ArticleEvent, ArticleState> {
  ArticleBloc(
    this._articleService,
  ) : super(const ArticleState()) {
    on<LoadArticlesEvent>(_loadArticle);
  }

  final ArticleService _articleService;

  Future<void> _loadArticle(
    LoadArticlesEvent event,
    Emitter<ArticleState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final listArt = await _articleService.getArticles();
        emit(state.copyWith(articles: listArt));
      },
    );
  }
}
