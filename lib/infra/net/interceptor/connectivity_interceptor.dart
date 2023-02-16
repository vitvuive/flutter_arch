import 'package:ddd_arch/infra/net/interceptor/base_interceptor.dart';
import 'package:dio/src/options.dart';
import 'package:dio/src/dio_mixin.dart';

class ConnectivityInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.connectivityPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// check connection here
    super.onRequest(options, handler);
  }
}
