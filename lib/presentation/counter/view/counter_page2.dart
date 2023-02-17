import 'package:bloc/src/bloc.dart';
import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/blocs/setting_bloc/setting_bloc.dart';
import 'package:ddd_arch/core/widgets/debounce_widget.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/presentation/counter/bloc/counter_event.dart';
import 'package:ddd_arch/presentation/counter/bloc/counter_state.dart';
import 'package:ddd_arch/presentation/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_listener.dart';
import 'package:flutter/src/widgets/framework.dart';

class CounterPage2
    extends BaseBlocStatelessWidget<CounterEvent, CounterState, CounterBloc> {
  CounterPage2({super.key});

  @override
  Widget builder(BuildContext context, CounterState state) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.counterAppBarTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: DebounceWidget(
              child: const Icon(Icons.colorize),
              onTap: () => context.read<SettingBloc>()..add(UpdateThemeEvent()),
            ),
          )
        ],
      ),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increase());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(Decrease());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
