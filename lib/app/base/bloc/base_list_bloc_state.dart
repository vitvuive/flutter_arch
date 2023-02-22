import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:ddd_arch/shared/pagging_setting/pagging_setting.dart';

/// T is entity type of list
class ListBlocState<T> extends BaseBlocState {
  ListBlocState({
    this.list = const [],
    this.currentPage = PaggingSetting.initPage,
    this.isLoading = false,
    this.canLoadmore = true,
  });

  final List<T> list;
  final int currentPage;
  final bool isLoading;
  final bool canLoadmore;

  ListBlocState<T> copyWith({
    List<T>? list,
    int? currentPage,
    bool Function()? isLoading,
    bool Function()? canLoadmore,
  }) {
    return ListBlocState(
      list: list ?? this.list,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading != null ? isLoading() : this.isLoading,
      canLoadmore: canLoadmore != null ? canLoadmore() : this.canLoadmore,
    );
  }
}
