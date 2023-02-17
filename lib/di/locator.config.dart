// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ddd_arch/app/base/bloc/common/common_bloc.dart' as _i18;
import 'package:ddd_arch/app/blocs/setting_bloc/setting_bloc.dart' as _i11;
import 'package:ddd_arch/app/navigation_impl.dart' as _i4;
import 'package:ddd_arch/core/navigation/app_navigator.dart' as _i3;
import 'package:ddd_arch/domain/repository/auth_repo.dart' as _i15;
import 'package:ddd_arch/domain/repository/user_repo.dart' as _i21;
import 'package:ddd_arch/infra/net/client/non_auth_api_client.dart' as _i29;
import 'package:ddd_arch/infra/net/client/refresh_token_api_client.dart'
    as _i25;
import 'package:ddd_arch/infra/net/interceptor/access_token_interceptor.dart'
    as _i23;
import 'package:ddd_arch/infra/net/interceptor/header_inteceptor.dart' as _i19;
import 'package:ddd_arch/infra/net/interceptor/refresh_token_interceptor.dart'
    as _i28;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/data_json_object_response_mapper.dart'
    as _i7;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_array_response_mapper.dart'
    as _i8;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_object_response_mapper.dart'
    as _i9;
import 'package:ddd_arch/infra/net/refresh_token_api.dart' as _i27;
import 'package:ddd_arch/infra/preference/app_preference.dart' as _i14;
import 'package:ddd_arch/infra/repository/auth_repo_impl.dart' as _i16;
import 'package:ddd_arch/infra/repository/user_repo_impl.dart' as _i22;
import 'package:ddd_arch/presentation/authen/login/blocs/login_bloc.dart'
    as _i20;
import 'package:ddd_arch/presentation/counter/bloc/counter_bloc.dart' as _i5;
import 'package:ddd_arch/presentation/home/blocs/home_bloc.dart' as _i26;
import 'package:ddd_arch/service/auth_service.dart' as _i17;
import 'package:ddd_arch/service/counter_service.dart' as _i6;
import 'package:ddd_arch/service/profile_service.dart' as _i24;
import 'package:ddd_arch/shared/app_info/app_info.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'locator.dart' as _i30;

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
  await gh.factoryAsync<_i10.PackageInfo>(
    () => appModule.packageInfo,
    preResolve: true,
  );
  gh.factory<_i11.SettingBloc>(() => _i11.SettingBloc());
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i13.AppInfo>(() => _i13.AppInfo(gh<_i10.PackageInfo>()));
  gh.lazySingleton<_i14.AppPreference>(
      () => _i14.AppPreference(gh<_i12.SharedPreferences>()));
  gh.singleton<_i15.AuthRepo>(_i16.AuthRepoImpl(gh<_i14.AppPreference>()));
  gh.singleton<_i17.AuthService>(_i17.AuthService(gh<_i15.AuthRepo>()));
  gh.factory<_i18.CommonBloc>(() => _i18.CommonBloc(gh<_i17.AuthService>()));
  gh.factory<_i19.HeaderInterceptor>(
      () => _i19.HeaderInterceptor(gh<_i13.AppInfo>()));
  gh.factory<_i20.LoginBloc>(() => _i20.LoginBloc(
        gh<_i17.AuthService>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.singleton<_i21.UserRepo>(_i22.UserRepoImpl(gh<_i14.AppPreference>()));
  gh.factory<_i23.AccessTokenInterceptor>(
      () => _i23.AccessTokenInterceptor(gh<_i14.AppPreference>()));
  gh.singleton<_i24.ProfileService>(_i24.ProfileService(gh<_i21.UserRepo>()));
  gh.lazySingleton<_i25.RefreshTokenApiClient>(() => _i25.RefreshTokenApiClient(
        gh<_i19.HeaderInterceptor>(),
        gh<_i23.AccessTokenInterceptor>(),
      ));
  gh.factory<_i26.HomeBloc>(() => _i26.HomeBloc(
        gh<_i17.AuthService>(),
        gh<_i24.ProfileService>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.lazySingleton<_i27.RefreshTokenApi>(
      () => _i27.RefreshTokenApi(gh<_i25.RefreshTokenApiClient>()));
  gh.factory<_i28.RefreshTokenInterceptor>(() => _i28.RefreshTokenInterceptor(
        gh<_i14.AppPreference>(),
        gh<_i27.RefreshTokenApi>(),
        gh<_i29.NoneAuthAppServerApiClient>(),
      ));
  return getIt;
}

class _$AppModule extends _i30.AppModule {}
