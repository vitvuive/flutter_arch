import 'package:ddd_arch/domain/repository/auth_repo.dart';
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
    this._nonAuthClient,
    this._userDataMapper,
  ) {
    _init();
  }

  final _streamStatus = BehaviorSubject.seeded(AuthStatus.unknow);

  final AppPreference _appPreference;
  final NoneAuthAppServerApiClient _nonAuthClient;
  final UserDataMapper _userDataMapper;

  Future<void> _init() async {
    final user = await _appPreference.getUserCurrentUser();
    if (user != null) {
      _streamStatus.add(AuthStatus.authenticated);
    }
  }

  @override
  Future<void> appleLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> facebookLogin() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    _streamStatus.add(AuthStatus.authenticated);
  }

  @override
  Future<void> googleLogin() {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await _appPreference.removeUser();
    await Future<void>.delayed(const Duration(seconds: 2));
    _streamStatus.add(AuthStatus.unAuthenticated);
  }

  @override
  Stream<AuthStatus> streamAuthStatus() => _streamStatus.asBroadcastStream();

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
    await _appPreference.saveToken(result.token ?? '');
    await _appPreference.setUser(_userDataMapper.mapToEntity(result));
    _streamStatus.add(AuthStatus.authenticated);
    return true;
  }

  @override
  Future<bool> register(
      {required String username, required String password}) async {
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
