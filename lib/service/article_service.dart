import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:ddd_arch/domain/repository/article_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class ArticleService {
  ArticleService(this.repo);

  final ArticleRepo repo;

  Future<List<Article>> getArticles() {
    return repo.getListArtile();
  }
}
