import 'package:dartx/dartx.dart';
import 'package:ddd_arch/core/exception/base/app_exception.dart';

import 'server_error.dart';

class RemoteException extends AppException {
  RemoteException({
    required this.kind,
    this.httpErrorCode,
    this.serverError,
    this.rootException,
  }) : super(AppExceptionType.remote);

  final RemoteExceptionKind kind;
  final int? httpErrorCode;
  final ServerError? serverError;
  final Object? rootException;

  int get generalServerStatusCode =>
      serverError?.generalServerStatusCode ??
      serverError?.errors.firstOrNull?.serverStatusCode ??
      -1;

  String? get generalServerErrorId =>
      serverError?.generalServerErrorId ??
      serverError?.errors.firstOrNull?.serverErrorId;

  String? get generalServerMessage =>
      serverError?.generalMessage ?? serverError?.errors.firstOrNull?.message;
}

enum RemoteExceptionKind {
  noInternet,

  /// host not found, cannot connect to host
  network,

  /// server has defined response
  serverDefined,

  /// server has not defined response
  serverUndefined,

  refreshTokenFailed,
  timeout,
  cancellation,
  unknown,
}
