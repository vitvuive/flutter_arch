import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/core/navigation/app_popup_info.dart';
import 'package:ddd_arch/l10n/l10n.dart';

abstract class AppNavigator {
  AppLocalizations get lang;

  Future<T?> pushName<T extends Object>(String name);

  Future<T?> pushReplaceName<T extends Object>(String name);

  Future<T?> replaceAllNamed<T extends Object>(String name);

  void pop<T extends Object>();

  /// base demo popup function,
  Future<T?> showDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
  });

  /// need improve this function
  void showGeneralDialog(String message);

  /// need improve this function
  void showSnackBar(String message);

  /// need improve this function
  void showErrorSnackBar(String message);
}
