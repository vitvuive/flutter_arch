// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ddd_arch/app/base/bloc/common/common_bloc.dart' as _i20;
import 'package:ddd_arch/app/blocs/setting_bloc/setting_bloc.dart' as _i13;
import 'package:ddd_arch/app/navigation_impl.dart' as _i4;
import 'package:ddd_arch/core/navigation/app_navigator.dart' as _i3;
import 'package:ddd_arch/domain/repository/auth_repo.dart' as _i17;
import 'package:ddd_arch/domain/repository/joke_repo.dart' as _i28;
import 'package:ddd_arch/domain/repository/user_repo.dart' as _i25;
import 'package:ddd_arch/infra/database/local_database.dart' as _i10;
import 'package:ddd_arch/infra/net/client/auth_api_client.dart' as _i37;
import 'package:ddd_arch/infra/net/client/non_auth_api_client.dart' as _i24;
import 'package:ddd_arch/infra/net/client/refresh_token_api_client.dart'
    as _i32;
import 'package:ddd_arch/infra/net/interceptor/access_token_interceptor.dart'
    as _i27;
import 'package:ddd_arch/infra/net/interceptor/header_inteceptor.dart' as _i22;
import 'package:ddd_arch/infra/net/interceptor/refresh_token_interceptor.dart'
    as _i36;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/data_json_object_response_mapper.dart'
    as _i7;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_array_response_mapper.dart'
    as _i8;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_object_response_mapper.dart'
    as _i9;
import 'package:ddd_arch/infra/net/refresh_token_api.dart' as _i35;
import 'package:ddd_arch/infra/preference/app_preference.dart' as _i16;
import 'package:ddd_arch/infra/repository/auth_repo_impl.dart' as _i18;
import 'package:ddd_arch/infra/repository/joke_repo_impl.dart' as _i29;
import 'package:ddd_arch/infra/repository/user_repo_impl.dart' as _i26;
import 'package:ddd_arch/presentation/authen/login/blocs/login_bloc.dart'
    as _i23;
import 'package:ddd_arch/presentation/counter/bloc/counter_bloc.dart' as _i5;
import 'package:ddd_arch/presentation/counter/cubit/counter_cubit.dart' as _i21;
import 'package:ddd_arch/presentation/home/blocs/home_bloc.dart' as _i33;
import 'package:ddd_arch/presentation/joke/blocs/joke_bloc.dart' as _i34;
import 'package:ddd_arch/service/auth_service.dart' as _i19;
import 'package:ddd_arch/service/counter_service.dart' as _i6;
import 'package:ddd_arch/service/joke_service.dart' as _i30;
import 'package:ddd_arch/service/profile_service.dart' as _i31;
import 'package:ddd_arch/shared/app_info/app_info.dart' as _i15;
import 'package:ddd_arch/shared/network_manager/network_manager.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import 'locator.dart' as _i38;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.AppNavigator>(_i4.NavigationImpl());
  gh.factory<_i5.CounterBloc>(() => _i5.CounterBloc());
  gh.singleton<_i6.CounterService>(_i6.CounterService());
  gh.factory<_i7.DataJsonObjectResponseMapper<dynamic>>(
      () => _i7.DataJsonObjectResponseMapper<dynamic>());
  gh.factory<_i8.JsonArrayResponseMapper<dynamic>>(
      () => _i8.JsonArrayResponseMapper<dynamic>());
  gh.factory<_i9.JsonObjectResponseMapper<dynamic>>(
      () => _i9.JsonObjectResponseMapper<dynamic>());
  gh.singleton<_i10.LocalStorage>(_i10.LocalStorage());
  gh.singleton<_i11.NetworkManager>(
    _i11.NetworkManager(),
    dispose: (i) => i.dispose(),
  );
  await gh.factoryAsync<_i12.PackageInfo>(
    () => appModule.packageInfo,
    preResolve: true,
  );
  gh.factory<_i13.SettingBloc>(() => _i13.SettingBloc());
  await gh.factoryAsync<_i14.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i15.AppInfo>(() => _i15.AppInfo(gh<_i12.PackageInfo>()));
  gh.lazySingleton<_i16.AppPreference>(
      () => _i16.AppPreference(gh<_i14.SharedPreferences>()));
  gh.singleton<_i17.AuthRepo>(_i18.AuthRepoImpl(gh<_i16.AppPreference>()));
  gh.singleton<_i19.AuthService>(_i19.AuthService(gh<_i17.AuthRepo>()));
  gh.factory<_i20.CommonBloc>(() => _i20.CommonBloc(gh<_i19.AuthService>()));
  gh.factory<_i21.CounterBloc>(() => _i21.CounterBloc(
        gh<_i6.CounterService>(),
        gh<_i19.AuthService>(),
      ));
  gh.factory<_i22.HeaderInterceptor>(
      () => _i22.HeaderInterceptor(gh<_i15.AppInfo>()));
  gh.factory<_i23.LoginBloc>(() => _i23.LoginBloc(
        gh<_i19.AuthService>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.lazySingleton<_i24.NoneAuthAppServerApiClient>(
      () => _i24.NoneAuthAppServerApiClient(gh<_i22.HeaderInterceptor>()));
  gh.singleton<_i25.UserRepo>(_i26.UserRepoImpl(gh<_i16.AppPreference>()));
  gh.factory<_i27.AccessTokenInterceptor>(
      () => _i27.AccessTokenInterceptor(gh<_i16.AppPreference>()));
  gh.singleton<_i28.JokeRepo>(
      _i29.JokeRepoImpl(gh<_i24.NoneAuthAppServerApiClient>()));
  gh.singleton<_i30.JokeService>(_i30.JokeService(gh<_i28.JokeRepo>()));
  gh.singleton<_i31.ProfileService>(_i31.ProfileService(gh<_i25.UserRepo>()));
  gh.lazySingleton<_i32.RefreshTokenApiClient>(() => _i32.RefreshTokenApiClient(
        gh<_i22.HeaderInterceptor>(),
        gh<_i27.AccessTokenInterceptor>(),
      ));
  gh.factory<_i33.HomeBloc>(() => _i33.HomeBloc(
        gh<_i19.AuthService>(),
        gh<_i31.ProfileService>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.factory<_i34.JokeBloc>(() => _i34.JokeBloc(gh<_i30.JokeService>()));
  gh.lazySingleton<_i35.RefreshTokenApi>(
      () => _i35.RefreshTokenApi(gh<_i32.RefreshTokenApiClient>()));
  gh.factory<_i36.RefreshTokenInterceptor>(() => _i36.RefreshTokenInterceptor(
        gh<_i16.AppPreference>(),
        gh<_i35.RefreshTokenApi>(),
        gh<_i24.NoneAuthAppServerApiClient>(),
      ));
  gh.lazySingleton<_i37.AuthAppServerApiClient>(
      () => _i37.AuthAppServerApiClient(
            gh<_i22.HeaderInterceptor>(),
            gh<_i27.AccessTokenInterceptor>(),
            gh<_i36.RefreshTokenInterceptor>(),
          ));
  return getIt;
}

class _$AppModule extends _i38.AppModule {}
