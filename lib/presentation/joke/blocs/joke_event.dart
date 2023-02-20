part of 'joke_bloc.dart';

abstract class JokeEvent extends BaseBlocEvent {}

class GetJokeEvent extends JokeEvent {}

class GetJokeListEvent extends JokeEvent {}
