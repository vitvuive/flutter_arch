import 'package:ddd_arch/infra/net/client/base/rest_api_client.dart';
import 'package:ddd_arch/infra/net/interceptor/access_token_interceptor.dart';
import 'package:ddd_arch/infra/net/interceptor/header_inteceptor.dart';
import 'package:ddd_arch/infra/net/interceptor/refresh_token_interceptor.dart';
import 'package:ddd_arch/shared/contants/url_contant.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthAppServerApiClient extends RestApiClient {
  AuthAppServerApiClient(
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
    RefreshTokenInterceptor refreshTokenInterceptor,
  ) : super(
          baseUrl: UrlConstants.appApiBaseUrl,
          interceptors: [
            headerInterceptor,
            accessTokenInterceptor,
            refreshTokenInterceptor,
          ],
        );
}
