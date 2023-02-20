import 'dart:io';

import 'package:ddd_arch/core/exception/exception_mapper.dart';
import 'package:ddd_arch/core/exception/remote/remote_exception.dart';
import 'package:ddd_arch/core/exception/remote/server_error.dart';
import 'package:ddd_arch/infra/net/mapper/base/base_error_response_mapper.dart';
import 'package:dio/dio.dart';

class DioExceptionMapper extends ExceptionMapper<RemoteException> {
  DioExceptionMapper(this._errorResponseMapper);

  final BaseErrorResponseMapper _errorResponseMapper;

  @override
  RemoteException map(Object? exception) {
    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.cancel:
          return const RemoteException(kind: RemoteExceptionKind.cancellation);
        case DioErrorType.connectionTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return RemoteException(
            kind: RemoteExceptionKind.timeout,
            rootException: exception,
          );
        case DioErrorType.badCertificate:
        case DioErrorType.badResponse:
          final httpErrorCode = exception.response?.statusCode ?? -1;
          if (exception.response?.data != null) {
            final serverError = exception.response!.data! is Map
                ? _errorResponseMapper.mapToEntity(exception.response!.data)
                : ServerError(
                    generalMessage: exception.response!.data as String?,
                  );
            return RemoteException(
              kind: RemoteExceptionKind.serverDefined,
              httpErrorCode: httpErrorCode,
              serverError: serverError,
            );
          }

          return RemoteException(
            kind: RemoteExceptionKind.serverUndefined,
            httpErrorCode: httpErrorCode,
            rootException: exception,
          );
        case DioErrorType.connectionError:
        case DioErrorType.unknown:
          if (exception is SocketException) {
            return RemoteException(
              kind: RemoteExceptionKind.network,
              rootException: exception,
            );
          }
          if (exception.error is RemoteException) {
            // ignore: cast_nullable_to_non_nullable
            return exception.error as RemoteException;
          }
      }
    }

    return RemoteException(
      kind: RemoteExceptionKind.unknown,
      rootException: exception,
    );
  }
}
