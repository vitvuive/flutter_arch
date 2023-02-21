import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/presentation/articles/view/article_page.dart';
import 'package:ddd_arch/presentation/authen/login/view/login_page.dart';
import 'package:ddd_arch/presentation/authen/register/register.dart';
import 'package:ddd_arch/presentation/counter/view/counter_page2.dart';
import 'package:ddd_arch/presentation/currency/view/currency_page.dart';
import 'package:ddd_arch/presentation/demo_error/view/error_page.dart';
import 'package:ddd_arch/presentation/home/home_page.dart';
import 'package:ddd_arch/presentation/joke/joke_page.dart';
import 'package:flutter/material.dart';

import 'route_transition/transition.dart';

class Routes {
  Routes._();

  static const String login = '/login';
  static const String home = '/home';
  static const String joke = '/joke';
  static const String register = '/register';
  static const String errorPage = '/errorPage';
  static const String counterPage = '/counterPage';
  static const String currency = '/currency';
  static const String articles = '/articles';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    joke: (context) => JokePage(),
    errorPage: (context) => ErrorPage(),
    counterPage: (context) => CounterPage2(),
    currency: (context) => CurrencyPage(),
    register: (context) => RegisterPage(),
    articles: (context) => ArticlePage(),
  };

  static Route<dynamic> getRouteGenerate(RouteSettings settings) {
    Map args = (settings.arguments ?? {}) as Map;
    switch (settings.name) {
      case Routes.home:
        return _buildRouteFade(settings, const HomePage());
      case Routes.login:
        return _buildRouteFade(settings, const LoginPage());
      case Routes.joke:
        return _buildRouteFade(settings, JokePage());
      case Routes.errorPage:
        return _buildRouteFade(settings, ErrorPage());
      case Routes.counterPage:
        return _buildRouteSlideRight(settings, CounterPage2());
      case Routes.currency:
        return _buildRouteSlideRight(settings, CurrencyPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return CScaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        );
      },
    );
  }

  static PageRouteBuilder<dynamic> _buildRouteFade(
    RouteSettings settings,
    Widget builder,
  ) {
    return FadedTransitionRoute(
      settings: settings,
      widget: builder,
    );
  }

  static PageRouteBuilder<dynamic> _buildRouteSlideRight(
    RouteSettings settings,
    Widget builder,
  ) {
    return SlideRightTransitionRoute(
      settings: settings,
      widget: builder,
    );
  }
}
