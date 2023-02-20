import 'package:ddd_arch/core/exception/base/app_exception.dart';

class ParseException extends AppException {
  const ParseException([
    this.rootException,
  ]) : super(AppExceptionType.parse);

  final Object? rootException;

  @override
  String toString() {
    return 'ParseException: {rootException: $rootException}';
  }
}
