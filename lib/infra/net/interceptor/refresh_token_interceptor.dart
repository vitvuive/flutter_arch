import 'dart:collection';
import 'dart:io';

import 'package:ddd_arch/infra/database/objectbox_data_base/models/token.dart';
import 'package:ddd_arch/infra/database/objectbox_data_base/token_dao.dart';
import 'package:ddd_arch/infra/net/client/non_auth_api_client.dart';
import 'package:ddd_arch/infra/net/interceptor/base_interceptor.dart';
import 'package:ddd_arch/infra/net/refresh_token_api.dart';
import 'package:ddd_arch/infra/preference/app_preference.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tuple/tuple.dart';

@injectable
class RefreshTokenInterceptor extends BaseInterceptor {
  RefreshTokenInterceptor(
    this.appPreference,
    this.tokenDao,
    this.refreshTokenApi,
    this.noneAuthAppServerApiClient,
  );

  @override
  int get priority => BaseInterceptor.refreshTokenPriority;

  final AppPreference appPreference;
  final TokenDao tokenDao;
  final RefreshTokenApi refreshTokenApi;
  final NoneAuthAppServerApiClient noneAuthAppServerApiClient;

  var _isRefreshing = false;

  final _queue = Queue<Tuple2<RequestOptions, ErrorInterceptorHandler>>();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final options = err.response!.requestOptions;
      _onExpiredToken(options, handler);
    } else {
      handler.next(err);
    }
  }

  void _putAccessToken(Map<String, dynamic> headers, String accessToken) {
    headers['Authorization'] = 'Bearer $accessToken';
  }

  void _onExpiredToken(
    RequestOptions options,
    ErrorInterceptorHandler handler,
  ) {
    _queue.addLast(Tuple2(options, handler));
    if (!_isRefreshing) {
      _isRefreshing = true;
      _refreshToken()
          .then(_onRefreshTokenSuccess)
          .catchError(_onRefreshTokenError)
          .whenComplete(() {
        _isRefreshing = false;
        _queue.clear();
      });
    }
  }

  Future<String> _refreshToken() async {
    _isRefreshing = true;
    final refreshToken = appPreference.refreshToken;
    final refreshTokenReponse =
        await refreshTokenApi.refreshToken(refreshToken);

    tokenDao.putToken(
      Token(accessToken: refreshTokenReponse.result?.accessToken ?? ''),
    );
    return refreshTokenReponse.result?.accessToken ?? '';
  }

  Future<void> _onRefreshTokenSuccess(String newToken) async {
    await Future.wait(
      _queue.map((requestInfo) {
        return _requestWithNewToken(
          requestInfo.item1,
          requestInfo.item2,
          newToken,
        );
      }),
    );
  }

  void _onRefreshTokenError(Object? error) {
    for (final element in _queue) {
      final options = element.item1;
      final handler = element.item2;
      handler.next(DioError(requestOptions: options, error: error));
    }
  }

  Future<void> _requestWithNewToken(
    RequestOptions options,
    ErrorInterceptorHandler handler,
    String newAccessToken,
  ) {
    _putAccessToken(options.headers, newAccessToken);

    return noneAuthAppServerApiClient
        .fetch(options)
        .then((response) => handler.resolve(response))
        .catchError(
          (e) => handler.next(
            DioError(requestOptions: options, error: e),
          ),
        );
  }
}
