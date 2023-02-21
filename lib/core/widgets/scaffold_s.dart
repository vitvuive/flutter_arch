import 'package:ddd_arch/core/widgets/auto_hide_keyboard.dart';
import 'package:flutter/material.dart';

class CScaffold extends StatelessWidget {
  const CScaffold({
    required this.body,
    super.key,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.appbar,
    this.resizeToAvoidBottom = true,
    this.floatingActionButton,
    this.appBar,
    this.backgroundAppColor,
    this.topSafe = true,
  });
  final Widget body;
  final Color? backgroundColor;
  final Color? backgroundAppColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? appbar;
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottom;
  final bool topSafe;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundAppColor ?? Theme.of(context).colorScheme.background,
      child: SafeArea(
        top: topSafe,
        child: Scaffold(
          appBar: appBar,
          resizeToAvoidBottomInset: resizeToAvoidBottom,
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.background,
          body: Column(
            children: [
              if (appbar != null) ...[appbar ?? Container()],
              Expanded(
                child: AutoHideKeyboard(child: body),
              )
            ],
          ),
          bottomNavigationBar: bottomNavigationBar,
          drawer: drawer,
          endDrawer: endDrawer,
          floatingActionButton: floatingActionButton,
        ),
      ),
    );
  }
}
