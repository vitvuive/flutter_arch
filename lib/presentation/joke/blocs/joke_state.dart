part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState({this.jokeList, this.joke});
  final JokeModel? joke;
  final JokeListModel? jokeList;

  JokeState copyWith({
    JokeModel? joke,
    JokeListModel? jokeList,
  });
}

class JokeInitial extends JokeState {
  // final int counter;
  const JokeInitial({JokeModel? joke, JokeListModel? jokeList})
      : super(
          joke: joke,
          jokeList: jokeList,
        );

  @override
  JokeInitial copyWith({
    JokeModel? joke,
    JokeListModel? jokeList,
  }) {
    return JokeInitial(
        joke: joke ?? this.joke, jokeList: jokeList ?? this.jokeList);
  }

  @override
  List<Object?> get props => [joke];
}
