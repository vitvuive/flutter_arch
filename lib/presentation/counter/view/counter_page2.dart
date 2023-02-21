import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/blocs/setting_bloc/setting_bloc.dart';
import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/presentation/counter/bloc/counter_event.dart';
import 'package:ddd_arch/presentation/counter/bloc/counter_state.dart';
import 'package:ddd_arch/presentation/counter/counter.dart';
import 'package:ddd_arch/shared/format/date_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CounterPage2
    extends BaseBlocStatelessWidget<CounterEvent, CounterState, CounterBloc> {
  CounterPage2({super.key});

  @override
  Widget builder(BuildContext context, CounterState state) {
    final l10n = context.l10n;
    final counterLog = context.select((CounterBloc bloc) => bloc.state.counter);
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
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: DebounceWidget(
          //     child: const Icon(Icons.money),
          //     onTap: () => Navigator.pushNamed(
          //       context,
          //       Routes.currency,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DebounceWidget(
              child: const Icon(Icons.language),
              onTap: () =>
                  context.read<SettingBloc>().add(ChangeLanguageEvent()),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          const Center(child: CounterText()),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        '${l10n.currentDateText} ${DateTime.now().toYMD(l10n.localeName)}'),
                    Text(
                        '${l10n.currentMoneyText} ${NumberFormat.simpleCurrency(locale: l10n.localeName).format(counterLog)}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increase',
            onPressed: () {
              context.read<CounterBloc>().add(Increase());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'decrease',
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
