enum AuthStatus { unknow, authenticated, unAuthenticated }

abstract class AuthRepo {
  Future<bool> userNamePasswordLogin({
    required String userName,
    required String password,
  });

  Future<void> facebookLogin();

  Future<void> googleLogin();

  Future<void> appleLogin();

  Future<void> logout();

  Stream<bool> streamAuthStatus();

  Future<bool> register({
    required String username,
    required String password,
  });
}
