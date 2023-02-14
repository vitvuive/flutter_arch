import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

// enum ThemeMode { light, dark }

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(ThemeMode.light) ThemeMode themeMode,
    @Default('en') String langCode,
  }) = _SettingState;
}
