import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/di/locator.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/app/base/basebloc_stateful_state.dart';
import 'package:ddd_arch/presentation/counter/bloc/counter_event.dart';
import 'package:ddd_arch/presentation/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterPage extends StatelessWidget {
//   const CounterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CounterBloc>(
//       create: (_) => getIt(),
//       child: const CounterView(),
//     );
//   }
// }

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState
    extends BaseBlocStatefulWidget<CounterPage, CounterBloc> {
  // _CounterViewState({super.key});

  @override
  Widget buildPage(BuildContext context) {
    final l10n = context.l10n;
    return CScaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => bloc.add(Increase()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => bloc.add(Decrease()),
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
    final counterLog = context.select((CounterBloc bloc) => bloc.state.counter);
    // final isLogin = context.select((CounterBloc bloc) => bloc.state.counter);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$counterLog', style: theme.textTheme.displayLarge),
        ],
      ),
    );
  }
}
