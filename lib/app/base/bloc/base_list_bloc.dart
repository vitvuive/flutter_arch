import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_list_bloc_event.dart';
import 'package:ddd_arch/shared/paging_setting/paging_setting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_list_bloc_state.dart';

abstract class BaseListBloc<T>
    extends BaseBloc<BaseListBlocEvent, ListBlocState<T>> {
  BaseListBloc() : super(ListBlocState<T>()) {
    on<LoadmoreEvent>(_loadmore);
    on<RefreshEvent>(_refresh);
    on<InitLoadEvent>(_initLoadEvent);

    add(InitLoadEvent());

    _init();
  }

  late final ScrollController _controller;

  ScrollController get controller => _controller;

  void _init() {
    _controller = ScrollController();
    _controller.addListener(_checkLoadMore);
  }

  void _checkLoadMore() {
    if (state.isLoading == false &&
        state.canLoadmore &&
        _controller.position.extentAfter < PagingSetting.threshHold) {
      onLoadmore();
    }
  }

  void onLoadmore() {
    add(LoadmoreEvent());
  }

  void onRefresh() {
    add(RefreshEvent());
  }

  Future<List<T>> getData({
    required int page,
  });

  Future<void> _initLoadEvent(
    InitLoadEvent event,
    Emitter<ListBlocState<T>> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: () => true,
      ),
    );
    await runBlocCatching(
      action: () async {
        final data = await getData(page: state.currentPage);
        emit(
          state.copyWith(
            list: data,
          ),
        );
      },
      handleLoading: false,
      doOnSuccessOrError: () async {
        emit(
          state.copyWith(
            isLoading: () => false,
          ),
        );
      },
    );
  }

  Future<void> _loadmore(
    LoadmoreEvent event,
    Emitter<ListBlocState<T>> emit,
  ) async {
    emit(
      state.copyWith(isLoading: () => true),
    );
    await runBlocCatching(
      action: () async {
        final data = await getData(page: state.currentPage);
        final canLoadmore = data.length == PagingSetting.size;
        emit(
          state.copyWith(
            list: [
              ...state.list,
              ...data,
            ],
            canLoadmore: () => canLoadmore,
            currentPage: state.currentPage + 1,
          ),
        );
      },
      handleLoading: false,
      doOnSuccessOrError: () async {
        emit(
          state.copyWith(
            isLoading: () => false,
          ),
        );
      },
    );
  }

  Future<void> _refresh(
    RefreshEvent event,
    Emitter<ListBlocState<T>> emit,
  ) async {
    emit(
      state.copyWith(
        list: [],
        currentPage: PagingSetting.initPage,
        canLoadmore: () => true,
      ),
    );
    add(InitLoadEvent());
  }
}
