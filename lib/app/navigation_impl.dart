import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:flutter/material.dart' as m;
import 'package:injectable/injectable.dart';

import 'navigation/base/base_popup_info_mapper.dart';

@Singleton(as: AppNavigator)
class NavigationImpl extends AppNavigator {
  NavigationImpl(this._appPopupInfoMapper);

  static final m.GlobalKey<m.NavigatorState> navigatorKey =
      m.GlobalKey<m.NavigatorState>();

  m.NavigatorState get currentState => navigatorKey.currentState!;

  m.BuildContext get navigatorContext => navigatorKey.currentContext!;

  final BasePopupInfoMapper _appPopupInfoMapper;

  @override
  AppLocalizations get lang => navigatorContext.l10n;

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
  void showGeneralDialog(String message) {
    // TODO: implement showGeneralDialog
  }

  @override
  void pop<T extends Object>() {
    return currentState.pop();
  }

  @override
  void showSnackBar(String message) {
    m.ScaffoldMessenger.of(currentState.context).showSnackBar(
      m.SnackBar(
        content: m.Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void showErrorSnackBar(String message) {
    m.ScaffoldMessenger.of(currentState.context).showSnackBar(
      m.SnackBar(
        content: m.Text(message),
        duration: const Duration(seconds: 1),
        backgroundColor: m.Colors.red,
      ),
    );
  }

  @override
  Future<T?> showDialog<T extends Object?>(AppPopupInfo appPopupInfo,
      {bool barrierDismissible = true, bool useSafeArea = false}) {
    return m.showDialog(
      context: currentState.context,
      builder: (context) {
        return m.WillPopScope(
          onWillPop: () async {
            return Future.value(true);
          },
          child: _appPopupInfoMapper.map(appPopupInfo, this),
        );
      },
    );
  }
}
