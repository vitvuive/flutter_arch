abstract class AuthRepo {
  Future<void> signOut();

  Future<void> signIn();

  Stream<bool> streamAuthState();

  bool get isLogin;
}
