import 'package:ddd_arch/app/navigation/app_navigator.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

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
}
