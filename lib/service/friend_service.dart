import 'package:ddd_arch/core/core.dart';
import 'package:ddd_arch/domain/models/friend/friend.dart';
import 'package:ddd_arch/domain/repository/friend_repo.dart';
import 'package:injectable/injectable.dart';

@singleton
class FriendService {
  FriendService(this.friendRepo);

  final FriendRepo friendRepo;

  Stream<List<Friend>> watchFriends() {
    return friendRepo.watchFriend();
  }

  bool addFriend(Friend friend) {
    return friendRepo.saveFriend(friend);
  }

  int clearFriend() {
    return friendRepo.deleteAllFiend();
  }

  bool deleteFriend(Friend friend) {
    return friendRepo.deleteFriend(friend.id ?? 0);
  }
}
