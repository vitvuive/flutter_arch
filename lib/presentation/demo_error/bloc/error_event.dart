import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';

abstract class ErrorEvent extends BaseBlocEvent {}

class ShowServerErrorEvent extends ErrorEvent {}

class ShowParseErrorEvent extends ErrorEvent {}

class ShowUnknownEvent extends ErrorEvent {}

class RefreshTokenFail extends ErrorEvent {}
