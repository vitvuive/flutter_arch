import 'package:ddd_arch/core/core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'base/base_popup_info_mapper.dart';

@LazySingleton(as: BasePopupInfoMapper)
class NavigationPopupMapper implements BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appPopupInfo, AppNavigator navigator) {
    return appPopupInfo.when(
      confirmDialog: (message, func) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                func?.call();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
      errorWithRetryDialog: (message, func) {
        return AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                func?.call();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                func?.call();
              },
              child: const Text('Retry'),
            )
          ],
        );
      },
      requiredLoginDialog: () {
        return AlertDialog(
          title: const Text('Required login'),
          actions: [
            TextButton(
              onPressed: () {
                navigator.pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
