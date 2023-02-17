import 'package:ddd_arch/domain/models/joke/joke.dart';
import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:ddd_arch/domain/models/user/user.dart';
import 'package:ddd_arch/domain/repository/joke_repo.dart';
import 'package:ddd_arch/domain/repository/user_repo.dart';
import 'package:ddd_arch/infra/net/client/base/rest_api_client.dart';
import 'package:ddd_arch/infra/net/client/non_auth_api_client.dart';
import 'package:ddd_arch/shared/contants/url_contant.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: JokeRepo)
class JokeRepoImpl implements JokeRepo {
  JokeRepoImpl(this.apiClient);
  final NoneAuthAppServerApiClient apiClient;

  @override
  Future<JokeModel> getJoke() async {
    final res = await apiClient.request(
      method: RestMethod.get,
      path: '${UrlConstants.jokePrefix}${UrlConstants.randomJoke}',
    );
    return res as JokeModel;
  }

  @override
  Future<JokeListModel> getJokeList() {
    return apiClient.request(
      method: RestMethod.get,
      path: '${UrlConstants.jokePrefix}${UrlConstants.ranfdom10Jokes}',
    );
  }
}
