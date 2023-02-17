import 'package:ddd_arch/core/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

// import '../presentation/authen/login/view/login_page.dart';
// import '../presentation/home/home_page.dart';

@Singleton(as: AppNavigator)
class NavigationImpl extends AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  NavigatorState get currentState => navigatorKey.currentState!;

  @override
  Future<T?> pushName<T extends Object>(String name) {
    return currentState.pushNamed(name);
  }

  @override
  Future<T?> pushReplaceName<T extends Object>(String name) {
    return currentState.pushReplacementNamed(name);
  }

  @override
  Future<T?> replaceAllNamed<T extends Object>(String name) {
    return currentState.pushNamedAndRemoveUntil(name, (route) => false);
  }

  @override
  void showDialog(String message) {
    // TODO: implement showDialog
  }

  @override
  void showGeneralDialog(String message) {
    // TODO: implement showGeneralDialog
  }

  @override
  void pop<T extends Object>() {
    return currentState.pop();
  }

  @override
  void showSnackBar(String message) {
    ScaffoldMessenger.of(currentState.context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
