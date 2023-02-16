// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ddd_arch/app/blocs/setting_bloc/setting_bloc.dart' as _i10;
import 'package:ddd_arch/app/navigation/app_navigator.dart' as _i3;
import 'package:ddd_arch/app/navigation_impl.dart' as _i4;
import 'package:ddd_arch/domain/repository/auth_repo.dart' as _i14;
import 'package:ddd_arch/domain/repository/user_repo.dart' as _i20;
import 'package:ddd_arch/infra/net/client/non_auth_api_client.dart' as _i28;
import 'package:ddd_arch/infra/net/client/refresh_token_api_client.dart'
    as _i24;
import 'package:ddd_arch/infra/net/interceptor/access_token_interceptor.dart'
    as _i22;
import 'package:ddd_arch/infra/net/interceptor/header_inteceptor.dart' as _i18;
import 'package:ddd_arch/infra/net/interceptor/refresh_token_interceptor.dart'
    as _i27;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/data_json_object_response_mapper.dart'
    as _i6;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_array_response_mapper.dart'
    as _i7;
import 'package:ddd_arch/infra/net/mapper/base_success_response_mapper/json_object_response_mapper.dart'
    as _i8;
import 'package:ddd_arch/infra/net/refresh_token_api.dart' as _i26;
import 'package:ddd_arch/infra/preference/app_preference.dart' as _i13;
import 'package:ddd_arch/infra/repository/auth_repo_impl.dart' as _i15;
import 'package:ddd_arch/infra/repository/user_repo_impl.dart' as _i21;
import 'package:ddd_arch/presentation/authen/login/blocs/login_bloc.dart'
    as _i19;
import 'package:ddd_arch/presentation/counter/cubit/counter_cubit.dart' as _i17;
import 'package:ddd_arch/presentation/home/blocs/home_bloc.dart' as _i25;
import 'package:ddd_arch/service/auth_service.dart' as _i16;
import 'package:ddd_arch/service/counter_service.dart' as _i5;
import 'package:ddd_arch/service/profile_service.dart' as _i23;
import 'package:ddd_arch/shared/app_info/app_info.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import 'locator.dart' as _i29;

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
  gh.singleton<_i5.CounterService>(_i5.CounterService());
  gh.factory<_i6.DataJsonObjectResponseMapper<dynamic>>(
      () => _i6.DataJsonObjectResponseMapper<dynamic>());
  gh.factory<_i7.JsonArrayResponseMapper<dynamic>>(
      () => _i7.JsonArrayResponseMapper<dynamic>());
  gh.factory<_i8.JsonObjectResponseMapper<dynamic>>(
      () => _i8.JsonObjectResponseMapper<dynamic>());
  await gh.factoryAsync<_i9.PackageInfo>(
    () => appModule.packageInfo,
    preResolve: true,
  );
  gh.factory<_i10.SettingBloc>(() => _i10.SettingBloc());
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i12.AppInfo>(() => _i12.AppInfo(gh<_i9.PackageInfo>()));
  gh.lazySingleton<_i13.AppPreference>(
      () => _i13.AppPreference(gh<_i11.SharedPreferences>()));
  gh.singleton<_i14.AuthRepo>(_i15.AuthRepoImpl(gh<_i13.AppPreference>()));
  gh.singleton<_i16.AuthService>(_i16.AuthService(gh<_i14.AuthRepo>()));
  gh.factory<_i17.CounterBloc>(() => _i17.CounterBloc(
        gh<_i5.CounterService>(),
        gh<_i16.AuthService>(),
      ));
  gh.factory<_i18.HeaderInterceptor>(
      () => _i18.HeaderInterceptor(gh<_i12.AppInfo>()));
  gh.factory<_i19.LoginBloc>(() => _i19.LoginBloc(
        gh<_i16.AuthService>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.singleton<_i20.UserRepo>(_i21.UserRepoImpl(gh<_i13.AppPreference>()));
  gh.factory<_i22.AccessTokenInterceptor>(
      () => _i22.AccessTokenInterceptor(gh<_i13.AppPreference>()));
  gh.singleton<_i23.ProfileService>(_i23.ProfileService(gh<_i20.UserRepo>()));
  gh.lazySingleton<_i24.RefreshTokenApiClient>(() => _i24.RefreshTokenApiClient(
        gh<_i18.HeaderInterceptor>(),
        gh<_i22.AccessTokenInterceptor>(),
      ));
  gh.factory<_i25.HomeBloc>(() => _i25.HomeBloc(
        gh<_i16.AuthService>(),
        gh<_i23.ProfileService>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.lazySingleton<_i26.RefreshTokenApi>(
      () => _i26.RefreshTokenApi(gh<_i24.RefreshTokenApiClient>()));
  gh.factory<_i27.RefreshTokenInterceptor>(() => _i27.RefreshTokenInterceptor(
        gh<_i13.AppPreference>(),
        gh<_i26.RefreshTokenApi>(),
        gh<_i28.NoneAuthAppServerApiClient>(),
      ));
  return getIt;
}

class _$AppModule extends _i29.AppModule {}
