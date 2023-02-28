import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/l10n/l10n.dart';
import 'package:ddd_arch/presentation/friend_list/bloc/friend_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../bloc/friend_list_bloc.dart';
import '../bloc/friend_list_state.dart';

class FriendListPage extends BaseBlocStatelessWidget<FriendListEvent,
    FriendListState, FriendListBloc> {
  @override
  Widget builder(BuildContext context, FriendListState state) {
    final lang = context.l10n;
    return CScaffold(
      appBar: AppBar(
        title: Text(lang.friendListText),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              Expanded(child: _ListFriendView()),
              Expanded(child: _RegisterFriendView()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  List<FriendListEvent> get initEvents => [RequestSubcribeEvent()];
}

class _ListFriendView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final friends = context.select((FriendListBloc bloc) => bloc.state.friends);
    final bloc = context.read<FriendListBloc>();
    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        final data = friends[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shadowColor: Theme.of(context).colorScheme.onBackground,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('Name: ${data.name}, phone: ${data.phone}'),
                  ),
                  IconButton(
                    onPressed: () {
                      bloc.add(DeleteFriendEvent(data));
                    },
                    icon: const Icon(Icons.delete),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _RegisterFriendView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FriendListBloc>();
    return ReactiveForm(
      formGroup: bloc.form,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            ReactiveTextField(
              decoration: const InputDecoration(label: Text('Name')),
              formControlName: 'name',
            ),
            ReactiveTextField(
              decoration: const InputDecoration(label: Text('Phone')),
              formControlName: 'phone',
            ),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return TextButton(
                  onPressed: form.valid
                      ? () {
                          bloc.add(AddFriendEvent());
                        }
                      : null,
                  child: const Text('Submit'),
                );
              },
            ),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return TextButton(
                  onPressed: bloc.state.friends.isNotEmpty
                      ? () {
                          bloc.add(ClearFriendEvent());
                        }
                      : null,
                  child: const Text('Clear'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
