import 'package:ddd_arch/domain/models/article/article.dart';

abstract class ArticleRepo {
  Future<List<Article>> getListArtile();
}
