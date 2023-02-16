import 'package:ddd_arch/infra/net/client/base/rest_api_client.dart';
import 'package:ddd_arch/infra/net/interceptor/header_inteceptor.dart';
import 'package:ddd_arch/shared/contants/url_contant.dart';

class NoneAuthAppServerApiClient extends RestApiClient {
  NoneAuthAppServerApiClient(
    HeaderInterceptor headerInterceptor,
  ) : super(
          baseUrl: UrlConstants.appApiBaseUrl,
          interceptors: [
            headerInterceptor,
          ],
        );
}
