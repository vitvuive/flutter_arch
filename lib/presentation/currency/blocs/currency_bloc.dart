import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:injectable/injectable.dart';

import 'currency_event.dart';
import 'currency_state.dart';

@injectable
class CurrencyBloc extends BaseBloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(const CurrencyState()) {
    on<CurrencyChangedEvent>(_currencyChanged);
  }

  Future<void> _currencyChanged(
    CurrencyChangedEvent event,
    Emitter<CurrencyState> emit,
  ) async {
    emit(
      state.copyWith(
          // viCurrency: StringFormat().usCurrency.format(event.currency),
          ),
    );
  }
}
