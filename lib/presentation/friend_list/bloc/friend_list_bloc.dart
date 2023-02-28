import 'package:bloc/bloc.dart';
import 'package:ddd_arch/app/base/bloc/base_bloc.dart';
import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/domain/models/friend/friend.dart';
import 'package:ddd_arch/service/friend_service.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'friend_list_event.dart';
import 'friend_list_state.dart';

@injectable
class FriendListBloc extends BaseBloc<FriendListEvent, FriendListState> {
  FriendListBloc(
    this._friendService,
    this._appNavigator,
  ) : super(const FriendListState()) {
    on<RequestSubcribeEvent>(_requestSubcribe);
    on<AddFriendEvent>(_addFriend);
    on<ClearFriendEvent>(_clearFriend);
    on<DeleteFriendEvent>(_deleteFriend);
    on<UndoDeleteFriend>(_undoDeleteFriend);
  }

  final FriendService _friendService;
  final AppNavigator _appNavigator;

  final form = FormGroup({
    'name': FormControl<String>(
      value: '',
      validators: [
        Validators.required,
      ],
    ),
    'phone': FormControl<String>(
      value: '',
    ),
  });

  Future<void> _requestSubcribe(
      RequestSubcribeEvent event, Emitter<FriendListState> emit) async {
    Log.d('Emit request submit');
    return emit.forEach(
      _friendService.watchFriends(),
      onData: (data) {
        return state.copyWith(
          friends: data,
        );
      },
    );
  }

  Future<void> _addFriend(
    AddFriendEvent event,
    Emitter<FriendListState> emit,
  ) async {
    if (form.valid) {
      final name = form.control('name').value as String;
      final phone = form.control('phone').value as String;
      _friendService.addFriend(
        Friend(name: name, phone: phone),
      );

      form.control('name').value = '';
      form.control('phone').value = '';
      form.reset();
    }
  }

  Future<void> _clearFriend(
    ClearFriendEvent event,
    Emitter<FriendListState> emit,
  ) async {
    _friendService.clearFriend();
  }

  Future<void> _deleteFriend(
    DeleteFriendEvent event,
    Emitter<FriendListState> emit,
  ) async {
    _friendService.deleteFriend(event.friend);
    emit(state.copyWith(currentDelete: event.friend));
    _appNavigator.showSnackBarWithTimer(
      'Deleted friend ${event.friend.name}',
      3,
      () => add(UndoDeleteFriend(state.currentDelete!)),
    );
  }

  Future<void> _undoDeleteFriend(
    UndoDeleteFriend event,
    Emitter<FriendListState> emit,
  ) async {
    _friendService.addFriend(
      Friend(
        name: event.friend.name,
        phone: event.friend.phone,
        id: event.friend.id,
      ),
    );
    emit(state.copyWith(currentDelete: event.friend));
  }
}
