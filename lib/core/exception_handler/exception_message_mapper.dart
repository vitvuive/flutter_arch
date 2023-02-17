import 'package:ddd_arch/core/exception/base/app_exception.dart';
import 'package:ddd_arch/core/exception/remote/remote_exception.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    switch (appException.appExceptionType) {
      case AppExceptionType.remote:
        final exception = appException as RemoteException;
        switch (exception.kind) {
          case RemoteExceptionKind.noInternet:
            return 'No internet';
          case RemoteExceptionKind.network:
            return 'Network';
          case RemoteExceptionKind.serverDefined:
            return 'Server defined';
          case RemoteExceptionKind.serverUndefined:
            return 'Server undefined';
          case RemoteExceptionKind.timeout:
            return 'Server timeout';
          case RemoteExceptionKind.unknown:
            return 'Server unknown';
          case RemoteExceptionKind.refreshTokenFailed:
            return 'Server refresh token fail';
          case RemoteExceptionKind.cancellation:
            return 'Server cancelation';
        }
      case AppExceptionType.parse:
        return 'parse';
      case AppExceptionType.remoteConfig:
        return 'Remote config';
      case AppExceptionType.uncaught:
        return 'Uncaught';
      case AppExceptionType.validation:
        return 'Validation';
    }
  }
}
