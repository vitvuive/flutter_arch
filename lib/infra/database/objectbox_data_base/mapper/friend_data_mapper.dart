import 'package:ddd_arch/domain/models/friend/friend.dart';
import 'package:ddd_arch/infra/database/objectbox_data_base/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

@injectable
class FriendDataMapper {
  Friend toFriend(User user) {
    return Friend(
      name: user.name,
      phone: user.phone,
      id: user.id,
    );
  }

  List<Friend> toListFriend(List<User> users) {
    return users.map(toFriend).toList();
  }

  User toUserEntity(Friend friend) {
    return User(
      name: friend.name,
      devices: ToMany<Device>(),
      phone: friend.phone,
      id: friend.id,
    );
  }
}
