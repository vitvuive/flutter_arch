import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/presentation/demo_error/bloc/error_bloc.dart';
import 'package:ddd_arch/presentation/demo_error/bloc/error_event.dart';
import 'package:ddd_arch/presentation/demo_error/bloc/error_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorPage
    extends BaseBlocStatelessWidget<ErrorEvent, ErrorState, ErrorBloc> {
  ErrorPage({super.key});

  @override
  Widget builder(BuildContext context, ErrorState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(ShowParseErrorEvent());
              },
              child: const Text('Parse error'),
            ),
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(ShowServerErrorEvent());
              },
              child: const Text('Server error'),
            ),
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(ShowUnknownEvent());
              },
              child: const Text('Unknown error'),
            ),
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(RefreshTokenFail());
              },
              child: const Text('Refresh token fail'),
            )
          ],
        ),
      ),
    );
  }
}
