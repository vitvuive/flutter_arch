import 'package:ddd_arch/app/base/basebloc_stateless_view.dart';
import 'package:ddd_arch/app/base/bloc/base_list_bloc_event.dart';
import 'package:ddd_arch/app/base/bloc/base_list_bloc_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/base_list_bloc.dart';

abstract class LoadmoreView<T, B extends BaseListBloc<T>>
    extends BaseBlocStatelessWidget<BaseListBlocEvent, ListBlocState<T>, B> {
  LoadmoreView({super.key});

  @override
  Widget builder(BuildContext context, ListBlocState<T> state) {
    final controller = context.read<B>().controller;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<B>().add(RefreshEvent());
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return buildItem(context, state.list[index]);
                },
              ),
            ),
            if (state.isLoading)
              const Center(child: CupertinoActivityIndicator()),
            if (!state.canLoadmore) const Text('Can not load more')
          ],
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, T item);
}
