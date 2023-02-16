import 'package:ddd_arch/infra/net/interceptor/base_interceptor.dart';
import 'package:ddd_arch/shared/app_info/app_info.dart';
import 'package:dio/src/options.dart';
import 'package:dio/src/dio_mixin.dart';
import 'package:injectable/injectable.dart';

@injectable
class HeaderInterceptor extends BaseInterceptor {
  HeaderInterceptor(this._appInfo);

  @override
  int get priority => BaseInterceptor.headerPriority;

  Map<String, dynamic> _headers = {};

  final AppInfo _appInfo;

  // ignore: avoid_setters_without_getters
  set headers(Map<String, dynamic> headers) {
    _headers = headers;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final userAgentValue = userAgentClientHintsHeader();
    options.headers['User-Agent'] = userAgentValue;
    options.headers.addAll(_headers);

    handler.next(options);
  }

  String userAgentClientHintsHeader() {
    return '${_appInfo.versionName}(${_appInfo.versionCode})';
  }
}
