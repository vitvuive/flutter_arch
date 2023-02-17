import 'dart:convert';

import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:ddd_arch/domain/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppPreference {
  const AppPreference(this._prefs);
  final SharedPreferences _prefs;

  static const String accessTokenKey = 'accessTokenKey';
  static const String userKey = 'userKey';
  static const String refreshTokenKey = 'refreshTokenKey';
  static const String themeKey = 'themeKey';

  String get accessToken => _prefs.getString(accessTokenKey) ?? '';

  String get refreshToken => _prefs.getString(refreshTokenKey) ?? '';

  bool get isLogin => accessToken.isNotEmpty;

  Future<void> saveToken(String token) => _prefs.setString(
        accessTokenKey,
        token,
      );

  Future<void> saveRefreshToken(String refreshToken) =>
      _prefs.setString(refreshTokenKey, refreshToken);

  MapJson? _getByKey(String key) {
    final jsonRaw = _prefs.getString(key);
    return jsonRaw != null ? json.decode(jsonRaw) as MapJson : null;
  }

  Future<void> _setByKey(String key, MapJson value) async {
    await _prefs.setString(
      key,
      json.encode(value),
    );
  }

  Future<User?> getUserCurrentUser() async {
    final user = _getByKey(userKey);
    if (user == null) return null;
    return User.fromJson(user);
  }

  Future<void> setUser(User user) async {
    await _setByKey(userKey, user.toJson());
  }

  Future<void> removeUser() async {
    await _prefs.remove(userKey);
  }

  Future<void> setTheme(String theme) async {
    await _prefs.setString(themeKey, theme);
  }

  Future<String?> getTheme() async {
    return _prefs.getString(themeKey);
  }
}
