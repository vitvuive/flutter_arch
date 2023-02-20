import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';

abstract class SplashEvent extends BaseBlocEvent {}

class RequestInitApp extends SplashEvent {}
