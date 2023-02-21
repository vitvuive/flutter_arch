import 'package:ddd_arch/app/base/bloc/base_bloc_event.dart';
import 'package:ddd_arch/app/base/bloc/common/common_bloc.dart';
import 'package:ddd_arch/app/base/bloc/common/common_event.dart';
import 'package:ddd_arch/app/base/bloc/common/common_state.dart';
import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/base_bloc.dart';
import 'bloc/base_bloc_state.dart';

abstract class BaseBlocStatelessWidget<E extends BaseBlocEvent,
        S extends BaseBlocState, B extends BaseBloc<E, S>>
    extends StatelessWidget implements ExceptionHandlerListener {
  BaseBlocStatelessWidget({super.key});

  Widget builder(BuildContext context, S state);

  // ignore: strict_raw_type
  List<BlocListener> get listeners => [];

  /// Set initial event call when bloc is created,
  /// because create bloc is work of this baseview
  final List<E> initEvents = [];

  late final AppNavigator navigator = getIt<AppNavigator>();

  late final ExceptionMessageMapper exceptionMessageMapper =
      const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );

  late final CommonBloc commonBloc = getIt<CommonBloc>()
    ..navigator = navigator
    // ..disposeBag = disposeBag
    // ..appBloc = appBloc
    ..exceptionHandler = exceptionHandler
    ..exceptionMessageMapper = exceptionMessageMapper;

  late final B bloc = getIt<B>()
    ..navigator = navigator
    // ..disposeBag = disposeBag
    // ..appBloc = appBloc
    ..commonBloc = commonBloc
    ..exceptionHandler = exceptionHandler
    ..exceptionMessageMapper = exceptionMessageMapper
    ..initEvents = initEvents;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
        BlocProvider(create: (_) => commonBloc)
      ],
      child: MultiBlocListener(
        listeners: [
          ...listeners,
          BlocListener<CommonBloc, CommonState>(
            listenWhen: (previous, current) =>
                previous.appExceptionWrapper != current.appExceptionWrapper &&
                current.appExceptionWrapper != null,
            listener: (context, state) {
              handleException(state.appExceptionWrapper!);
            },
          ),
        ],
        child: Stack(
          children: [
            BlocBuilder<B, S>(
              builder: builder,
            ),
            BlocBuilder<CommonBloc, CommonState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              builder: (context, state) => Visibility(
                visible: state.isLoading,
                child: buildPageLoading(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
      appExceptionWrapper,
      handleExceptionMessage(appExceptionWrapper.appException),
    )
        .then((value) {
      appExceptionWrapper.exceptionCompleter?.complete();
    });
  }

  String handleExceptionMessage(AppException appException) {
    return exceptionMessageMapper.map(appException);
  }

  @override
  void onRefreshTokenFailed() {
    commonBloc.add(const ForceLogout());
  }
}

class RefreshTokenFailListener implements ExceptionHandlerListener {
  RefreshTokenFailListener(this.commonBloc);

  final CommonBloc commonBloc;

  @override
  void onRefreshTokenFailed() {
    commonBloc.add(const ForceLogout());
  }
}
