import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';

abstract class CurrencyEvent extends BaseBlocEvent {
  CurrencyEvent();

  @override
  List<Object?> get props => [];
}

class CurrencyChangedEvent extends CurrencyEvent {
  CurrencyChangedEvent(this.currency);

  final String currency;

  @override
  List<Object?> get props => [currency];
}
