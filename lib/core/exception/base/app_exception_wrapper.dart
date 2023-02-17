import 'dart:async';

import 'app_exception.dart';

class AppExceptionWrapper {
  AppExceptionWrapper({
    required this.appException,
    this.exceptionCompleter,
    this.doOnRetry,
    this.overrideMessage,
  });

  final AppException appException;
  final Completer<void>? exceptionCompleter;
  final Future<void> Function()? doOnRetry;
  final String? overrideMessage;
}
