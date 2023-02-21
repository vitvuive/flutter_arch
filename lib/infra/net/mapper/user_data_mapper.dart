import 'package:ddd_arch/domain/models/user/user.dart';
import 'package:ddd_arch/infra/net/mapper/base/base_data_mapper.dart';
import 'package:ddd_arch/infra/net/model/login_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDataMapper extends BaseDataMapper<LoginData, User> {
  @override
  User mapToEntity(LoginData? data) {
    return User(
      id: '${data?.result?.id ?? ''}',
      name: '${data?.result?.name}',
      email: data?.result?.email ?? '',
    );
  }
}
