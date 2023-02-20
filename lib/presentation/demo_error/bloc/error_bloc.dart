import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/presentation/demo_error/bloc/error_event.dart';
import 'package:ddd_arch/presentation/demo_error/bloc/error_state.dart';
import 'package:ddd_arch/service/error_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ErrorBloc extends BaseBloc<ErrorEvent, ErrorState> {
  ErrorBloc(this._errorService) : super(ErrorState()) {
    on<ShowParseErrorEvent>(_showParseError);
    on<ShowServerErrorEvent>(_showServerError);

    on<ShowUnknownEvent>(_showUnknowError);
    on<RefreshTokenFail>(_refreshTokenFail);
  }

  final ErrorService _errorService;

  Future<void> _showParseError(
    ShowParseErrorEvent event,
    Emitter<ErrorState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await _errorService.showParseError();
      },
    );
  }

  Future<void> _showServerError(
    ShowServerErrorEvent event,
    Emitter<ErrorState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await _errorService.showNetworkError();
      },
    );
  }

  Future<void> _showUnknowError(
    ShowUnknownEvent event,
    Emitter<ErrorState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await _errorService.showUncaughtError();
      },
    );
  }

  Future<void> _refreshTokenFail(
    RefreshTokenFail event,
    Emitter<ErrorState> emit,
  ) async {
    await runBlocCatching(action: () async {
      await _errorService.showRevokeToken();
    });
  }
}
