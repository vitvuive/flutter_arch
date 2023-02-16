import 'package:ddd_arch/infra/net/client/refresh_token_api_client.dart';
import 'package:ddd_arch/infra/net/model/base_data/data_response.dart';
import 'package:ddd_arch/infra/net/model/refresh_token_data.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RefreshTokenApi {
  RefreshTokenApi(this._refreshTokenApiClient);

  final RefreshTokenApiClient _refreshTokenApiClient;

  Future<DataResponse<RefreshTokenData>> refreshToken(
    String refreshToken,
  ) async {
    return DataResponse(
      data: const RefreshTokenData(accessToken: '123123123123'),
    );
  }
}
