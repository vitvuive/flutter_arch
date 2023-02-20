import 'package:ddd_arch/presentation/authen/login/view/login_page.dart';
import 'package:ddd_arch/presentation/counter/view/counter_page2.dart';
import 'package:ddd_arch/presentation/demo_error/view/error_page.dart';
import 'package:ddd_arch/presentation/home/home_page.dart';
import 'package:ddd_arch/presentation/joke/joke_page.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String joke = '/joke';
  static const String register = '/register';
  static const String errorPage = '/errorPage';
  static const String counterPage = '/counterPage';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    joke: (context) => JokePage(),
    errorPage: (context) => ErrorPage(),
    counterPage: (context) => CounterPage2(),
  };
}
