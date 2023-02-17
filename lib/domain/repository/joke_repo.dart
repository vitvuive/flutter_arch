import 'package:ddd_arch/domain/models/joke/joke.dart';

abstract class JokeRepo {
  Future<JokeModel> getJoke();

  Future<JokeListModel> getJokeList();
}
