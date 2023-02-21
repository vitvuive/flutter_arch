import 'package:ddd_arch/core/core.dart';
import 'package:flutter/material.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static String? currentRootName = 'root';

  void _showScreenView(PageRoute<dynamic> route) {
    currentRootName = route.settings.name ?? 'none';
    Log.d('Screen name: $currentRootName', name: 'MyRouteObserver');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _showScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _showScreenView(newRoute);
    }
  }
}
