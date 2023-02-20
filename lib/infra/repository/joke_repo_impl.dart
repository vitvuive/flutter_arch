import 'package:ddd_arch/domain/models/joke/joke.dart';
import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:ddd_arch/domain/repository/joke_repo.dart';
import 'package:ddd_arch/infra/net/client/base/rest_api_client.dart';
import 'package:ddd_arch/infra/net/client/non_auth_api_client.dart';
import 'package:ddd_arch/infra/net/model/base_data/data_response.dart';
import 'package:ddd_arch/shared/contants/url_contant.dart';
import 'package:ddd_arch/shared/model/enum/shared_enum.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: JokeRepo)
class JokeRepoImpl implements JokeRepo {
  JokeRepoImpl(this.apiClient);
  final NoneAuthAppServerApiClient apiClient;

  @override
  Future<JokeModel> getJoke() async {
    final res = await apiClient.request<JokeModel, JokeModel>(
      method: RestMethod.get,
      path: '${UrlConstants.jokePrefix}${UrlConstants.randomJoke}',
      decoder: JokeModel.fromJson,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
    );
    return res;
  }

  @override
  Future<JokeListModel> getJokeList() async {
    final responseData = await apiClient.request<List<JokeModel>, JokeModel>(
      method: RestMethod.get,
      path: '${UrlConstants.jokePrefix}${UrlConstants.ranfdom10Jokes}',
      decoder: JokeModel.fromJson,
      successResponseMapperType: SuccessResponseMapperType.jsonArray,
    );

    return JokeListModel(jokes: responseData);
  }
}
