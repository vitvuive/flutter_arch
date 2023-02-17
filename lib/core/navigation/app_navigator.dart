abstract class AppNavigator {
  Future<T?> pushName<T extends Object>(String name);

  Future<T?> pushReplaceName<T extends Object>(String name);

  Future<T?> replaceAllNamed<T extends Object>(String name);

  void pop<T extends Object>();

  void showDialog(String message);

  void showGeneralDialog(String message);

  void showSnackBar(String message);
}
