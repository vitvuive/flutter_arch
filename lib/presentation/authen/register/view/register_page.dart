import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/presentation/authen/register/blocs/register_bloc.dart';
import 'package:ddd_arch/presentation/authen/register/blocs/register_event.dart';
import 'package:ddd_arch/presentation/authen/register/blocs/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterPage extends BaseBlocStatelessWidget<RegisterEvent, RegisterState,
    RegisterBloc> {
  RegisterPage({super.key});

  @override
  Widget builder(BuildContext context, RegisterState state) {
    final form = context.read<RegisterBloc>().form;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReactiveTextField(
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                  validationMessages: {
                    'email': (o) => 'not an email',
                    'required': (o) => 'password required',
                    'minLength': (o) => 'Min length',
                  },
                ),
                ReactiveTextField(
                  formControlName: 'password',
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  validationMessages: {
                    'required': (o) => 'password required',
                    'minLength': (o) => 'Min length',
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                ReactiveFormConsumer(builder: (context, form, _) {
                  return TextButton(
                    onPressed: form.valid
                        ? () {
                            context
                                .read<RegisterBloc>()
                                .add(SubmitRegisterEvent());
                          }
                        : null,
                    child: const Text('Register'),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
