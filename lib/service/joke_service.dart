import 'package:ddd_arch/domain/models/joke/joke.dart';
import 'package:ddd_arch/domain/repository/joke_repo.dart';
import 'package:ddd_arch/infra/repository/joke_repo_impl.dart';
import 'package:injectable/injectable.dart';

@singleton
class JokeService {
  JokeService(
    this.jokeRepo,
  );

  final JokeRepo jokeRepo;

  Future<JokeModel> getJoke() async {
    return jokeRepo.getJoke();
  }

  Future<JokeListModel> getJokeList() async {
    return jokeRepo.getJokeList();
  }
}
