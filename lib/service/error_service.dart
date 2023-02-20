import 'package:ddd_arch/core/exception/parse/parse_exception.dart';
import 'package:ddd_arch/core/exception/remote/remote_exception.dart';
import 'package:ddd_arch/core/exception/unknow/unknow_exception.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorService {
  Future<void> showNetworkError() {
    throw const RemoteException(
      kind: RemoteExceptionKind.noInternet,
    );
  }

  Future<void> showParseError() {
    throw const ParseException();
  }

  Future<void> showUncaughtError() {
    throw const UnCaughtException();
  }

  Future<void> showRevokeToken() async {
    throw const RemoteException(kind: RemoteExceptionKind.refreshTokenFailed);
  }
}
