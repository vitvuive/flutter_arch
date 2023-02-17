import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';

abstract class CounterEvent extends BaseBlocEvent {}

class Increase extends CounterEvent {}

class Decrease extends CounterEvent {}
