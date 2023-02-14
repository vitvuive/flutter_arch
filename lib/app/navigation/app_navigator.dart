abstract class AppNavigator {
  Future<T?> pushName<T extends Object>(String name);

  Future<T?> pushReplaceName<T extends Object>(String name);

  Future<T?> replaceAllNamed<T extends Object>(String name);
}
