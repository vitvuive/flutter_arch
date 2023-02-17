import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.freezed.dart';

@freezed
class CounterState extends BaseBlocState with _$CounterState {
  const factory CounterState({
    @Default(0) int counter,
  }) = _CounterState;
}
