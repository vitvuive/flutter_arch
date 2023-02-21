import 'package:ddd_arch/core/core.dart';
import 'package:flutter/material.dart';

abstract class BasePopupInfoMapper {
  Widget map(AppPopupInfo appPopupInfo, AppNavigator navigator);
}
