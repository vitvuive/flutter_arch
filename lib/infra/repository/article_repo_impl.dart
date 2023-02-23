import 'dart:math';

import 'package:ddd_arch/domain/models/article/article.dart';
import 'package:ddd_arch/domain/repository/article_repo.dart';
import 'package:ddd_arch/infra/net/client/auth_api_client.dart';
import 'package:ddd_arch/infra/net/client/base/rest_api_client.dart';
import 'package:ddd_arch/infra/net/mapper/article_data_mapper.dart';
import 'package:ddd_arch/infra/net/model/article_data.dart';
import 'package:ddd_arch/infra/net/model/base_data/data_response.dart';
import 'package:ddd_arch/shared/model/enum/shared_enum.dart';
import 'package:ddd_arch/shared/paging_setting/paging_setting.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticleRepo)
class ArticleRepoImpl extends ArticleRepo {
  ArticleRepoImpl(this._authClient, this.mapper);

  final AuthAppServerApiClient _authClient;

  final ArticleDataMapper mapper;
  @override
  Future<List<Article>> getListArtile() async {
    final datas =
        await _authClient.request<DataListResponse<ArticleData>, ArticleData>(
      method: RestMethod.get,
      path: '/articles',
      decoder: ArticleData.fromJson,
      successResponseMapperType: SuccessResponseMapperType.dataJsonArray,
    );

    return mapper.mapToListEntity(datas.result);
  }

  @override
  Future<List<Article>> getListArtPage({
    int page = 0,
    int size = PagingSetting.size,
  }) async {
    final datas =
        await _authClient.request<DataListResponse<ArticleData>, ArticleData>(
      method: RestMethod.get,
      path: '/articles',
      decoder: ArticleData.fromJson,
      successResponseMapperType: SuccessResponseMapperType.dataJsonArray,
    );

    return mapper.mapToListEntity(
      (datas.result ?? []).sublist(
        page * size,
        min(page * size + size, datas.result?.length ?? 0),
      ),
    );
  }
}
