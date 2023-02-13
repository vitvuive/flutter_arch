import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import 'package:ddd_arch/data/repository/auth_repo.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final BehaviorSubject<bool> _subject = BehaviorSubject.seeded(false);

  @override
  Future<void> signIn() async {
    _subject.add(true);
  }

  @override
  Future<void> signOut() async {
    _subject.add(false);
  }

  @override
  Stream<bool> streamAuthState() => _subject.asBroadcastStream();

  @override
  bool get isLogin => _subject.value;
}
