import 'package:ddd_arch/data/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthService {
  AuthService(this.authRepo);

  final AuthRepo authRepo;

  Future<void> login() => authRepo.signIn();

  Future<void> logout() => authRepo.signOut();
}
