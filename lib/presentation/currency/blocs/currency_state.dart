import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_state.freezed.dart';

@freezed
class CurrencyState extends BaseBlocState with _$CurrencyState {
  const factory CurrencyState({
    @Default('0') String currency,
    String? viCurrency,
  }) = _CurrencyState;
}
