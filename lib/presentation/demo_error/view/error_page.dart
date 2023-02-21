import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/l10n/l10n.dart';
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
    final l10n = context.l10n;
    return CScaffold(
      appBar: AppBar(
        title: Text(l10n.errorAppBarTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(ShowParseErrorEvent());
              },
              child: Text(l10n.parseErrorText),
            ),
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(ShowServerErrorEvent());
              },
              child: Text(l10n.serverErrorText),
            ),
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(ShowUnknownEvent());
              },
              child: Text(l10n.unknownErrorText),
            ),
            TextButton(
              onPressed: () {
                context.read<ErrorBloc>().add(RefreshTokenFail());
              },
              child: Text(l10n.refreshTokenFailText),
            )
          ],
        ),
      ),
    );
  }
}
