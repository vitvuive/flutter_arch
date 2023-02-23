import 'package:ddd_arch/app/base/bloc/base_list_bloc.dart';
import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:ddd_arch/service/article_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticleListBloc extends BaseListBloc<Article> {
  ArticleListBloc(this._articleService);

  final ArticleService _articleService;

  @override
  Future<List<Article>> getData({required int page}) async {
    final data = await _articleService.getPagingArticle(
      page: page,
    );
    return data;
  }
}
