import 'package:ddd_arch/core/exception/base/app_exception.dart';

class UnCaughtException extends AppException {
  const UnCaughtException([this.stackTrace]) : super(AppExceptionType.uncaught);

  final Object? stackTrace;
}
