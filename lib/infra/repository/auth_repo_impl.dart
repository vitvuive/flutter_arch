import 'package:ddd_arch/domain/models/user/user.dart';
import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:ddd_arch/infra/preference/app_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this._appPreference) {
    _init();
  }

  final _streamStatus = BehaviorSubject.seeded(AuthStatus.unknow);

  final AppPreference _appPreference;

  Future<void> _init() async {
    final user = await _appPreference.getUserCurrentUser();
    if (user != null) {
      _streamStatus.add(AuthStatus.authenticated);
    }
  }

  @override
  Future<void> appleLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> facebookLogin() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    _streamStatus.add(AuthStatus.authenticated);
  }

  @override
  Future<void> googleLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await _appPreference.removeUser();
    await Future<void>.delayed(const Duration(seconds: 2));
    _streamStatus.add(AuthStatus.unAuthenticated);
  }

  @override
  Stream<AuthStatus> streamAuthStatus() => _streamStatus.asBroadcastStream();

  @override
  Future<void> userNamePasswordLogin({
    required String userName,
    required String password,
  }) async {
    await _appPreference.setUser(
      User(
        name: userName,
        birthDay: DateTime.now().toIso8601String(),
      ),
    );
    _streamStatus.add(AuthStatus.authenticated);
  }
}
