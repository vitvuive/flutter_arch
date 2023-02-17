import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

import 'counter_event.dart';
import 'counter_state.dart';

@injectable
class CounterBloc extends BaseBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<Increase>(_increase);
    on<Decrease>(_decrease);
  }

  Future<void> _increase(Increase event, Emitter<CounterState> emit) async {
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _decrease(Decrease event, Emitter<CounterState> emit) async {
    await runBlocCatching(action: () async {
      await Future.delayed(const Duration(milliseconds: 500));
    }, doOnEventCompleted: () async {
      emit(state.copyWith(counter: state.counter - 1));
      navigator.showSnackBar('Decrease success');
    });
  }
}
