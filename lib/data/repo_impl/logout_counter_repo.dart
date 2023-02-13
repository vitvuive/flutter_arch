import 'dart:convert';

import 'package:ddd_arch/data/repository/counter_repo.dart';
import 'package:ddd_arch/domain/counter_log.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LogoutCounterRepo implements CounterRepo {
  LogoutCounterRepo() {
    _init();
  }
  // final SharedPreferences _local = SharedPreferences.getInstance();
  static const String kCounter = 'kLougoutKey';

  late final SharedPreferences _plugin;

  Future<void> _init() async {
    _plugin = await SharedPreferences.getInstance();

    final initJson = _getValue(kCounter);
    final counter = initJson != null
        ? CounterLog.fromJson(json.decode(initJson) as Map<String, Object?>)
        : CounterLog(count: 0, lastUpdate: DateTime.now());
    _subject.add(counter);
    await _setValue(kCounter, json.encode(counter));
  }

  final BehaviorSubject<CounterLog> _subject = BehaviorSubject();

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  @override
  Future<void> decrease() async {
    final counterJson = _subject.value;
    final counter = counterJson;
    _subject.add(counter.decrease());
  }

  @override
  Future<void> increase() async {
    final counterJson = _subject.value;
    final counter = counterJson;
    _subject.add(counter.increase());
  }

  @override
  Stream<CounterLog> watchCounter() => _subject.asBroadcastStream();

  @disposeMethod
  Future<void> dispose() async {
    await _setValue(
      kCounter,
      json.encode(_subject.value),
    );
  }
}
