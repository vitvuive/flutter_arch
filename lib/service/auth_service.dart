import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthService {
  AuthService(
    this.authRepo,
  );

  final AuthRepo authRepo;

  Stream<AuthStatus> get streamStatus => authRepo.streamAuthStatus();

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
}
