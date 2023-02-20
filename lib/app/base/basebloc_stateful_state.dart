import 'package:ddd_arch/app/base/bloc/common/common_bloc.dart';
import 'package:ddd_arch/app/base/bloc/common/common_event.dart';
import 'package:ddd_arch/core/exception/base/app_exception.dart';
import 'package:ddd_arch/core/exception/base/app_exception_wrapper.dart';
import 'package:ddd_arch/core/exception_handler/exception_handler.dart';
import 'package:ddd_arch/core/exception_handler/exception_message_mapper.dart';
import 'package:ddd_arch/core/navigation/app_navigator.dart';
import 'package:ddd_arch/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/base_bloc.dart';
import 'bloc/common/common_state.dart';

abstract class BaseBlocStatefulWidget<T extends StatefulWidget,
    B extends BaseBloc> extends BasePageStateDelegate<T, B> {}

abstract class BasePageStateDelegate<T extends StatefulWidget,
    B extends BaseBloc> extends State<T> implements ExceptionHandlerListener {
  late final AppNavigator navigator = getIt<AppNavigator>();
  // late final AppBloc appBloc = GetIt.instance.get<AppBloc>();
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
    ..exceptionMessageMapper = exceptionMessageMapper;

  //late final DisposeBag disposeBag = DisposeBag();

  bool get isAppWidget => false;

  @override
  Widget build(BuildContext context) {
    if (!isAppWidget) {
      // AppDimen.of(context);
      // AppColors.of(context);
    }

    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc),
          BlocProvider(create: (_) => commonBloc),
        ],
        child: BlocListener<CommonBloc, CommonState>(
          listenWhen: (previous, current) =>
              previous.appExceptionWrapper != current.appExceptionWrapper &&
              current.appExceptionWrapper != null,
          listener: (context, state) {
            _handleException(state.appExceptionWrapper!);
          },
          child: buildPageListeners(
            child: isAppWidget
                ? buildPage(context)
                : Stack(
                    children: [
                      buildPage(context),
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
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    //disposeBag.dispose();
  }

  void _handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
      appExceptionWrapper,
      _handleExceptionMessage(appExceptionWrapper.appException),
    )
        .then((value) {
      appExceptionWrapper.exceptionCompleter?.complete();
    });
  }

  String _handleExceptionMessage(AppException appException) {
    return exceptionMessageMapper.map(appException);
  }

  @override
  void onRefreshTokenFailed() {
    commonBloc.add(const ForceLogout());
  }
}
