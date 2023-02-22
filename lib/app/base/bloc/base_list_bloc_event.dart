import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';

abstract class BaseListBlocEvent extends BaseBlocEvent {}

class LoadmoreEvent extends BaseListBlocEvent {
  LoadmoreEvent();

  //final int page;
}

class RefreshEvent extends BaseListBlocEvent {}

class InitLoadEvent extends BaseListBlocEvent {}
