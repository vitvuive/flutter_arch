import 'package:ddd_arch/infra/net/client/base/rest_api_client.dart';
import 'package:ddd_arch/infra/net/interceptor/access_token_interceptor.dart';
import 'package:ddd_arch/infra/net/interceptor/header_inteceptor.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RefreshTokenApiClient extends RestApiClient {
  RefreshTokenApiClient(
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
  ) : super(
          baseUrl: '',
          interceptors: [
            headerInterceptor,
            accessTokenInterceptor,
          ],
        );
}
