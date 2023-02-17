import 'package:ddd_arch/domain/models/user/user.dart';

abstract class UserRepo {
  Future<User?> getCurrentUser();

  Future<void> setCurrentUser(User user);

  Stream<User?> streamUser();
}
