import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_log.freezed.dart';
part 'counter_log.g.dart';

@freezed
class CounterLog with _$CounterLog {
  const factory CounterLog({required int count, required DateTime lastUpdate}) =
      _CounterLog;

  factory CounterLog.fromJson(Map<String, Object?> json) =>
      _$CounterLogFromJson(json);
}

// extension MutableCounterLog on CounterLog {
//   CounterLog setCount(int count) {
//     return copyWith(
//       count: count,
//       lastUpdate: DateTime.now(),
//     );
//   }

//   CounterLog increase() {
//     return setCount(count + 1);
//   }

//   CounterLog decrease() {
//     return setCount(count - 1);
//   }
// }
