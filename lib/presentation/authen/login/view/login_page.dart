import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/di/locator.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/presentation/authen/login/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => getIt(),
      child: _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<LoginBloc>();
    //final currentState = context.select((LoginBloc bloc) => bloc.state);
    return CScaffold(
      appBar: AppBar(
        title: Text(l10n.loginText),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text(l10n.userNameText),
                ),
                onChanged: (value) {
                  bloc.add(InputUserNameEvent(value));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(l10n.passwordText),
                ),
                onChanged: (value) {
                  bloc.add(InputPasswordEvent(value));
                },
              ),
              TextButton(
                onPressed: () {
                  bloc.add(SubmitUserNameEvent());
                },
                child: Text(l10n.loginText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
