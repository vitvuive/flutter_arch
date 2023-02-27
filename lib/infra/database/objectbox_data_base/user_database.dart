import 'package:ddd_arch/infra/database/objectbox_data_base/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@lazySingleton
class UserDatabase {
  UserDatabase(this.store);

  final Store store;

  int putUser(User user) {
    return store.box<User>().put(user);
  }

  Stream<List<User>?> watchUsers() {
    return store
        .box<User>()
        .query()
        .watch(
          triggerImmediately: true,
        )
        .map(
          (event) => event.find(),
        );
  }

  User? getUser(int id) {
    return store.box<User>().get(id);
  }

  List<User> getListUser() {
    return store.box<User>().getAll();
  }

  int deleteAllUser() {
    return store.box<User>().removeAll();
  }

  bool deleteUser(int id) {
    return store.box<User>().remove(id);
  }
}
