import 'package:ddd_arch/presentation/authen/login/view/login_page.dart';
import 'package:ddd_arch/presentation/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static String login = '/login';
  static String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage()
  };
}
