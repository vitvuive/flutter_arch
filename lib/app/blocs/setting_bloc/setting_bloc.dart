import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/blocs/setting_bloc/setting_state.dart';
import 'package:ddd_arch/core/resource/theme.dart';
import 'package:ddd_arch/infra/preference/app_preference.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'setting_event.dart';

@singleton
class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc(this._appPreference) : super(const SettingState()) {
    on<RequestSubcribeSettingEvent>(_requestSubcribe);
    on<UpdateThemeEvent>(_updateTheme);

    add(RequestSubcribeSettingEvent());
  }
  final AppPreference _appPreference;

  Future<void> _requestSubcribe(
    RequestSubcribeSettingEvent event,
    Emitter<SettingState> emit,
  ) async {
    //return state
    ThemeMode? themeData;
    final theme = await _appPreference.getTheme();
    if (theme != null) {
      themeData = theme == 'light' ? ThemeMode.light : ThemeMode.dark;
    } else {
      themeData = ThemeMode.light;
      await _appPreference.setTheme('light');
    }
    emit(state.copyWith(themeMode: themeData));
  }

  Future<void> _updateTheme(
    UpdateThemeEvent event,
    Emitter<SettingState> emit,
  ) async {
    //return state
    final theme = await _appPreference.getTheme();
    final themeData = theme == 'light' ? ThemeMode.dark : ThemeMode.light;
    await _appPreference.setTheme(theme == 'light' ? 'dark' : 'light');
    emit(state.copyWith(themeMode: themeData));
  }
}
