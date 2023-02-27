import 'package:ddd_arch/app/base/bloc/base_bloc_state.dart';
import 'package:ddd_arch/domain/models/friend/friend.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_list_state.freezed.dart';

@freezed
class FriendListState extends BaseBlocState with _$FriendListState {
  const factory FriendListState({
    @Default([]) List<Friend> friends,
    Friend? currentDelete,
  }) = _FriendListState;
}
