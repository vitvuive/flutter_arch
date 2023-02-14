import 'dart:convert';

import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:ddd_arch/domain/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppPreference {
  const AppPreference(this._prefs);
  final SharedPreferences _prefs;

  static const String accessTokenKey = 'accessTokenKey';
  static const String userKey = 'userKey';

  String? get accessToken => _prefs.getString(accessTokenKey);

  bool get isLogin => accessToken != null && accessToken!.isNotEmpty;

  Future<void> saveToken(String token) => _prefs.setString(
        accessTokenKey,
        token,
      );

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

  Future<User> getUserCurrentUser() async {
    final user = _getByKey(userKey);
    if (user == null) throw Exception('Not found user');
    return User.fromJson(user);
  }

  Future<void> setUser(User user) async {
    await _setByKey(userKey, user.toJson());
  }

  Future<void> removeUser() async {
    await _prefs.remove(userKey);
  }
}
