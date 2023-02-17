import 'package:ddd_arch/domain/models/user/user.dart';
import 'package:ddd_arch/domain/repository/user_repo.dart';
import 'package:ddd_arch/infra/preference/app_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Singleton(as: UserRepo)
class UserRepoImpl implements UserRepo {
  UserRepoImpl(this._appPreference) {
    _init();
  }

  Future<void> _init() async {
    final user = await getCurrentUser();
    if (user != null) _stream.add(user);
  }

  final AppPreference _appPreference;

  final _stream = BehaviorSubject<User>();

  @override
  Future<User?> getCurrentUser() {
    return _appPreference.getUserCurrentUser();
  }

  @override
  Stream<User?> streamUser() => _stream.asBroadcastStream();

  @override
  Future<void> setCurrentUser(User user) async {
    await _appPreference.setUser(user);
    _stream.add(user);
  }
}
