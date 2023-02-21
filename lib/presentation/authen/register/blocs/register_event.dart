import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';

abstract class RegisterEvent extends BaseBlocEvent {}

class SubmitRegisterEvent extends RegisterEvent {}
