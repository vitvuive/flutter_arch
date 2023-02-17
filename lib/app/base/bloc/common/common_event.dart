import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';
import 'package:ddd_arch/core/exception/base/app_exception_wrapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_event.freezed.dart';

abstract class CommonEvent extends BaseBlocEvent {
  const CommonEvent();
}

@freezed
class ExceptionEmitted extends CommonEvent with _$ExceptionEmitted {
  const factory ExceptionEmitted(
      {required AppExceptionWrapper appExceptionWrapper}) = _ExceptionEmitted;
}

@freezed
class LoadingVisibilityEmitted extends CommonEvent
    with _$LoadingVisibilityEmitted {
  const factory LoadingVisibilityEmitted({
    required bool isLoading,
  }) = _LoadingVisibilityEmitted;
}

@freezed
class ForceLogout extends CommonEvent with _$ForceLogout {
  const factory ForceLogout() = _ForceLogout;
}
