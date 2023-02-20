part of 'home_bloc.dart';

abstract class HomeEvent extends BaseBlocEvent {
  @override
  List<Object?> get props => [];
}

class RequestSubcribeState extends HomeEvent {}

class UpdateUserProfile extends HomeEvent {}

class LogoutEvent extends HomeEvent {}
