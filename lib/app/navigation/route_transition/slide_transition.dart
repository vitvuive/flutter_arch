import 'package:flutter/material.dart';

class SlideRightTransitionRoute extends PageRouteBuilder<dynamic> {
  SlideRightTransitionRoute({required this.widget, required this.settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
  final Widget widget;
  @override
  final RouteSettings settings;
}
