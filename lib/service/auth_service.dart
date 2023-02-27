import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class AuthService {
  AuthService(
    this.authRepo,
  ) {
    _init();
  }

  final AuthRepo authRepo;

  Stream<bool> get streamStatus => authRepo.streamAuthStatus();

  final _disposable = CompositeSubscription();

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void _init() {
    streamStatus.listen((event) {
      _isLogin = event;
    }).addTo(_disposable);
  }

  Future<bool> login({
    required String username,
    required String password,
  }) =>
      authRepo.userNamePasswordLogin(
        userName: username,
        password: password,
      );

  Future<void> facebookLogin() async {
    return authRepo.facebookLogin();
  }

  Future<void> appleLogin() async {
    return authRepo.appleLogin();
  }

  Future<void> logout() => authRepo.logout();

  Future<void> clearDataLogin() async {}

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    final registerResult = await authRepo.register(
      username: email,
      password: password,
    );
    return registerResult;
  }

  @disposeMethod
  void dispose() {
    _disposable.clear();
  }
}
