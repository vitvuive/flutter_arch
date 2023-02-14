enum AuthStatus { unknow, authenticated, unAuthenticated }

abstract class AuthRepo {
  Future<void> userNamePasswordLogin({
    required String userName,
    required String password,
  });

  Future<void> facebookLogin();

  Future<void> googleLogin();

  Future<void> appleLogin();

  Future<void> logout();

  Stream<AuthStatus> streamAuthStatus();
}
