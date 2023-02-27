import 'package:ddd_arch/domain/models/friend/friend.dart';
import 'package:ddd_arch/domain/repository/friend_repo.dart';
import 'package:ddd_arch/infra/database/objectbox_data_base/mapper/friend_data_mapper.dart';
import 'package:ddd_arch/infra/database/objectbox_data_base/user_dao.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FriendRepo)
class FriendRepoImpl implements FriendRepo {
  FriendRepoImpl(this._mapper, this._userDd);

  final FriendDataMapper _mapper;
  final UserDao _userDd;

  @override
  int deleteAllFiend() {
    return _userDd.deleteAllUser();
  }

  @override
  bool deleteFriend(int id) {
    return _userDd.deleteUser(id);
  }

  @override
  Friend getFriend(int id) {
    final user = _userDd.getUser(id);
    if (user == null) throw Exception('User not existed');
    return _mapper.toFriend(user);
  }

  @override
  List<Friend> getFriends() {
    final users = _userDd.getListUser();
    return _mapper.toListFriend(users);
  }

  @override
  bool saveFriend(Friend friend) {
    final id = _userDd.putUser(_mapper.toUserEntity(friend));
    return id != 0;
  }

  @override
  Stream<List<Friend>> watchFriend() {
    return _userDd.watchUsers().map((event) {
      return _mapper.toListFriend(event ?? []);
    });
  }
}
