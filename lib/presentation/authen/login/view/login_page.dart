import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/navigation/routes.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/presentation/authen/login/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _LoginView();
  }
}

class _LoginView
    extends BaseBlocStatelessWidget<LoginEvent, LoginState, LoginBloc> {
  @override
  Widget builder(BuildContext context, LoginState state) {
    final l10n = context.l10n;
    final bloc = context.read<LoginBloc>();
    final form = context.read<LoginBloc>().form;
    return CScaffold(
      appBar: AppBar(
        title: Text(l10n.loginText),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ReactiveForm(
            formGroup: form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReactiveTextField(
                  formControlName: 'email',
                  decoration: InputDecoration(
                    label: Text(l10n.userNameText),
                  ),
                  validationMessages: {
                    'email': (o) => 'email not valid',
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                ReactiveTextField(
                  formControlName: 'password',
                  decoration: InputDecoration(
                    label: Text(l10n.passwordText),
                  ),
                  validationMessages: {
                    'required': (o) => 'password is required',
                    'minLenght': (o) => 'min length is 8',
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 32,
                ),
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return TextButton(
                      onPressed: form.valid
                          ? () {
                              bloc.add(SubmitUserNameEvent());
                            }
                          : null,
                      child: Text(l10n.loginText),
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.register);
                  },
                  child: Text(l10n.registerText),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
