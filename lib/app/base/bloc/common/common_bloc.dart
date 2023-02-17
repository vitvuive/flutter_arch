import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/service/auth_service.dart';
import 'package:injectable/injectable.dart';
// import 'package:ddd_arch/app/base/bloc/common/common_state.dart';

import 'common_event.dart';
import 'common_state.dart';

@injectable
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc(this.authService) : super(const CommonState()) {
    on<LoadingVisibilityEmitted>(_onLoadingVisibilityEmitted);
    on<ExceptionEmitted>(_onExceptionEmitted);
    on<ForceLogout>(_onForceLogoutButtonPressed);
  }

  final AuthService authService;

  FutureOr<void> _onLoadingVisibilityEmitted(
    LoadingVisibilityEmitted event,
    Emitter<CommonState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: state.loadingCount == 0 && event.isLoading
            ? true
            : state.loadingCount == 1 && !event.isLoading ||
                    state.loadingCount <= 0
                ? false
                : state.isLoading,
        loadingCount: event.isLoading
            ? state.loadingCount.plus(1)!
            : state.loadingCount.minus(1)!,
      ),
    );
  }

  FutureOr<void> _onExceptionEmitted(
    ExceptionEmitted event,
    Emitter<CommonState> emit,
  ) {
    emit(state.copyWith(appExceptionWrapper: event.appExceptionWrapper));
  }

  FutureOr<void> _onForceLogoutButtonPressed(
    ForceLogout event,
    Emitter<CommonState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await authService.clearDataLogin();
        await navigator.replaceAllNamed(Routes.login);
      },
    );
  }
}
