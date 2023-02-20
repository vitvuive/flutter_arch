import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/blocs/setting_bloc/setting_bloc.dart';
import 'package:ddd_arch/core/resource/dimens.dart';
import 'package:ddd_arch/core/widgets/debounce_widget.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/presentation/currency/blocs/currency_bloc.dart';
import 'package:ddd_arch/presentation/currency/blocs/currency_event.dart';
import 'package:ddd_arch/presentation/currency/blocs/currency_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends BaseBlocStatelessWidget<CurrencyEvent, CurrencyState,
    CurrencyBloc> {
  CurrencyPage({super.key});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget builder(BuildContext context, CurrencyState state) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.currencyAppBarTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: DebounceWidget(
              child: const Icon(Icons.colorize),
              onTap: () => context.read<SettingBloc>()..add(UpdateThemeEvent()),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(l10n.currencyAppBarTitle),
          ),
          AppDimensions.vSpacing8,
          TextFormField(
            controller: _textEditingController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Color(0xfff3f3f4),
              filled: true,
            ),
          ),
          MaterialButton(
            onPressed: () {
              context.read<CurrencyBloc>().add(
                    CurrencyChangedEvent(
                      _textEditingController.text,
                    ),
                  );
            },
            child: const Text('Convert'),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(context.read<CurrencyBloc>().state.viCurrency ?? ''),
          ),
        ],
      ),
    );
  }
}
