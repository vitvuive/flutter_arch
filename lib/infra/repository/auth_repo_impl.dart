import 'package:ddd_arch/domain/repository/auth_repo.dart';
import 'package:ddd_arch/infra/database/objectbox_data_base/models/token.dart';
import 'package:ddd_arch/infra/database/objectbox_data_base/token_dao.dart';
import 'package:ddd_arch/infra/net/client/base/rest_api_client.dart';
import 'package:ddd_arch/infra/net/client/non_auth_api_client.dart';
import 'package:ddd_arch/infra/net/mapper/user_data_mapper.dart';
import 'package:ddd_arch/infra/net/model/login_data.dart';
import 'package:ddd_arch/infra/net/model/register_data.dart';
import 'package:ddd_arch/infra/preference/app_preference.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(
    this._appPreference,
    this._tokenDao,
    this._nonAuthClient,
    this._userDataMapper,
  ) {
    _init();
  }

  final _streamStatus = BehaviorSubject.seeded(false);

  final AppPreference _appPreference;
  final TokenDao _tokenDao;
  final NoneAuthAppServerApiClient _nonAuthClient;
  final UserDataMapper _userDataMapper;

  Future<void> _init() async {
    //final user = await _appPreference.getUserCurrentUser();
    final token = _tokenDao.getToken();
    if (token != null) {
      _streamStatus.add(token.accessToken.isNotEmpty);
    }
  }

  @override
  Future<void> appleLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> facebookLogin() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    _streamStatus.add(true);
  }

  @override
  Future<void> googleLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    // await _appPreference.removeUser();
    _tokenDao.deleteAllToken();
    await Future<void>.delayed(const Duration(seconds: 2));
    _streamStatus.add(false);
  }

  @override
  Stream<bool> streamAuthStatus() => _streamStatus.asBroadcastStream();

  @override
  Future<bool> userNamePasswordLogin({
    required String userName,
    required String password,
  }) async {
    final result = await _nonAuthClient.request<LoginData, LoginData>(
      method: RestMethod.post,
      path: '/login',
      decoder: LoginData.fromJson,
      body: {
        'email': userName,
        'password': password,
      },
    );
    _tokenDao.putToken(Token(accessToken: result.token ?? ''));
    await _appPreference.setUser(_userDataMapper.mapToEntity(result));
    _streamStatus.add(result.token?.isNotEmpty ?? false);
    return true;
  }

  @override
  Future<bool> register({
    required String username,
    required String password,
  }) async {
    final body = {
      'name': 'Test user',
      'email': username,
      'phone': '5555551234',
      'password': password,
      'password_confirmation': password
    };
    final result = await _nonAuthClient.request<RegisterData, RegisterData>(
      method: RestMethod.post,
      path: '/register',
      decoder: RegisterData.fromJson,
      body: body,
    );
    return result.success;
  }
}
