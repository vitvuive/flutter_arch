import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:ddd_arch/domain/repository/article_repo.dart';
import 'package:ddd_arch/shared/pagging_setting/pagging_setting.dart';
import 'package:injectable/injectable.dart';

@singleton
class ArticleService {
  ArticleService(this.repo);

  final ArticleRepo repo;

  Future<List<Article>> getArticles() {
    return repo.getListArtile();
  }

  Future<List<Article>> getPaggingArticle({
    int page = 0,
    int size = PaggingSetting.size,
  }) {
    return repo.getListArtPage(
      page: page,
      size: size,
    );
  }
}
