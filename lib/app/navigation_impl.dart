import 'package:ddd_arch/app/navigation/app_navigator.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../presentation/authen/login/view/login_page.dart';
import '../presentation/home/home_page.dart';

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

class Routes {
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage()
  };
}
