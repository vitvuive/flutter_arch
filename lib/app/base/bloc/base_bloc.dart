import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:ddd_arch/app/base/bloc/common/common_bloc.dart';
import 'package:ddd_arch/app/base/bloc/common/common_event.dart';
import 'package:ddd_arch/core/exception/base/app_exception.dart';
import 'package:ddd_arch/core/exception/base/app_exception_wrapper.dart';
import 'package:ddd_arch/core/exception/remote/remote_exception.dart';
import 'package:ddd_arch/core/exception_handler/exception_handler.dart';
import 'package:ddd_arch/core/exception_handler/exception_message_mapper.dart';
import 'package:ddd_arch/core/navigation/app_navigator.dart';
import 'package:ddd_arch/core/utils/log_utils.dart';
import 'package:ddd_arch/di/locator.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> {
  BaseBloc(super.initState);
}

abstract class BaseBlocDelegate<E extends BaseBlocEvent,
    S extends BaseBlocState> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  late final AppNavigator navigator;
  // late final
  late final ExceptionHandler exceptionHandler;

  late final ExceptionMessageMapper exceptionMessageMapper;
  //late final DisposeBag

  late final CommonBloc _commonBloc;

  set commonBloc(CommonBloc commonBloc) {
    _commonBloc = commonBloc;
  }

  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      Log.e('Cannot add new event $event because $runtimeType was closed');
    }
  }

  Future<void> addException(AppExceptionWrapper appExceptionWrapper) async {
    commonBloc.add(
      ExceptionEmitted(appExceptionWrapper: appExceptionWrapper),
    );

    return appExceptionWrapper.exceptionCompleter?.future;
  }

  void showLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: true));
  }

  void hideLoading() {
    commonBloc.add(const LoadingVisibilityEmitted(isLoading: false));
  }

  Future<void> runBlocCatching({
    required Future<void> Function() action,
    Future<void> Function()? doOnRetry,
    Future<void> Function(AppException)? doOnError,
    Future<void> Function()? doOnSubcribe,
    Future<void> Function()? doOnSuccessOrError,
    Future<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = true,
    bool handleRetry = true,
    bool Function(AppException)? forceHandleError,
    String? overrideErrorMessage,
  }) async {
    Completer<void>? recursion;
    try {
      await doOnSubcribe?.call();
      if (handleLoading) {
        showLoading();
      }

      await action.call();

      if (handleLoading) {
        hideLoading();
      }

      await doOnSuccessOrError?.call();
    } on AppException catch (e) {
      if (handleLoading) {
        hideLoading();
      }

      await doOnSuccessOrError?.call();

      await doOnError?.call(e);

      if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
        await addException(
          AppExceptionWrapper(
            appException: e,
            doOnRetry: doOnRetry ??
                (handleRetry
                    ? () async {
                        recursion = Completer();
                        await runBlocCatching(
                          action: action,
                          doOnEventCompleted: doOnEventCompleted,
                          doOnSubcribe: doOnSubcribe,
                          doOnSuccessOrError: doOnSuccessOrError,
                          doOnError: doOnError,
                          doOnRetry: doOnRetry,
                          forceHandleError: forceHandleError,
                          handleError: handleError,
                          handleLoading: handleLoading,
                          handleRetry: handleRetry,
                          overrideErrorMessage: overrideErrorMessage,
                        );
                        recursion?.complete();
                      }
                    : null),
            exceptionCompleter: Completer<void>(),
            overrideMessage: overrideErrorMessage,
          ),
        );
      }
    } finally {
      await recursion?.future;
      await doOnEventCompleted?.call();
    }
  }

  bool _forceHandleError(AppException appException) {
    return appException is RemoteException &&
        appException.kind == RemoteExceptionKind.refreshTokenFailed;
  }
}
