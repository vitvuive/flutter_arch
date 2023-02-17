import 'dart:core';

import 'package:ddd_arch/domain/models/joke/joke.dart';
import 'package:ddd_arch/service/joke_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'joke_event.dart';

part 'joke_state.dart';

@injectable
class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc(this._jokeService) : super(const JokeInitial()) {
    on<GetJokeEvent>(_getJoke);
    on<GetJokeListEvent>(_getJokeList);
  }
  final JokeService _jokeService;

  Future<void> _getJoke(GetJokeEvent event, Emitter<JokeState> emit) async {
    final joke = await _jokeService.getJoke();
    emit(state.copyWith(joke: joke));
  }

  Future<void> _getJokeList(
    GetJokeListEvent event,
    Emitter<JokeState> emit,
  ) async {
    final jokeList = await _jokeService.getJokeList();
    emit(state.copyWith(jokeList: jokeList));
  }
}
