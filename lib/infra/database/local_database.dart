import 'dart:convert';

import 'package:ddd_arch/domain/models/map_json.dart';
import 'package:ddd_arch/domain/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalStorage {
  LocalStorage();

  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  static const String accessTokenKey = 'accessTokenKey';
  static const String userKey = 'userKey';
  static const String refreshTokenKey = 'refreshTokenKey';

  Future<void> init() async {}

  Future<void> setByKey(String key, String data) async {
    return storage.write(key: key, value: data);
  }

  Future<String?> getByKey(String key) async {
    return storage.read(key: key);
  }

  Future<void> removeByKey(String key) async {
    return storage.delete(key: key);
  }

  Future<void> setAccessToken(String token) async {
    await storage.write(key: accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return storage.read(key: accessTokenKey);
  }

  Future<void> setRefreshToken(String token) async {
    await storage.write(key: refreshTokenKey, value: token);
  }

  Future<String?> getRefreshToken() async {
    return storage.read(key: refreshTokenKey);
  }

  Future<User?> getUserCurrentUser() async {
    final user = await getByKey(userKey);
    if (user == null) return null;
    return User.fromJson(json.decode(user) as MapJson);
  }

  Future<void> setUser(User user) async {
    await setByKey(userKey, json.encode(user.toJson()));
  }

  Future<void> removeUser() async {
    await removeByKey(userKey);
  }
}
