import 'package:ddd_arch/domain/models/friend/friend.dart';

abstract class FriendRepo {
  List<Friend> getFriends();

  bool saveFriend(Friend friend);

  Friend getFriend(int id);

  bool deleteFriend(int id);

  int deleteAllFiend();

  Stream<List<Friend>> watchFriend();
}
