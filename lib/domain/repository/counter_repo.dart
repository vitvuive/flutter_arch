import 'package:ddd_arch/domain/models/counter_log.dart';

abstract class CounterRepo {
  Stream<CounterLog> watchCounter();

  Future<void> increase();

  Future<void> decrease();
}
