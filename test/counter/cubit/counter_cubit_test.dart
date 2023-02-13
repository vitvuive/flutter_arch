import 'package:bloc_test/bloc_test.dart';
import 'package:ddd_arch/presentation/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(CounterBloc().state, equals(0));
    });

    blocTest<CounterBloc, int>(
      'emits [1] when increment is called',
      build: CounterBloc.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<CounterBloc, int>(
      'emits [-1] when decrement is called',
      build: CounterBloc.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
