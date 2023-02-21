import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:ddd_arch/infra/net/mapper/base/base_data_mapper.dart';
import 'package:ddd_arch/infra/net/model/article_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticleDataMapper extends BaseDataMapper<ArticleData, Article> {
  @override
  Article mapToEntity(ArticleData? data) {
    return Article(
      id: data?.id ?? 0,
      title: data?.title ?? '',
      body: data?.body ?? '',
    );
  }
}
