import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/di/locator.dart';
import 'package:ddd_arch/presentation/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => getIt(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(Add()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(Sub()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final counterLog =
        context.select((CounterBloc bloc) => bloc.state.counterLog);

    final isLogin = context.select((CounterBloc bloc) => bloc.state.isLogin);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${counterLog.count}', style: theme.textTheme.displayLarge),
          Text('Time clicked: ${counterLog.lastUpdate.toIso8601String()}'),
          if (isLogin)
            TextButton(
              onPressed: () {
                context.read<CounterBloc>().add(Logout());
              },
              child: const Text('Logout'),
            )
          else
            TextButton(
              onPressed: () {
                context.read<CounterBloc>().add(Login());
              },
              child: const Text('Login'),
            ),
        ],
      ),
    );
  }
}
