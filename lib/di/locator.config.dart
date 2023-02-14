// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ddd_arch/app/blocs/setting_bloc/setting_bloc.dart' as _i6;
import 'package:ddd_arch/app/navigation/app_navigator.dart' as _i3;
import 'package:ddd_arch/app/navigation_impl.dart' as _i4;
import 'package:ddd_arch/application/auth_service.dart' as _i11;
import 'package:ddd_arch/application/counter_service.dart' as _i5;
import 'package:ddd_arch/application/profile_service.dart' as _i16;
import 'package:ddd_arch/domain/repository/auth_repo.dart' as _i9;
import 'package:ddd_arch/domain/repository/user_repo.dart' as _i14;
import 'package:ddd_arch/infra/preference/app_preference.dart' as _i8;
import 'package:ddd_arch/infra/repository/auth_repo_impl.dart' as _i10;
import 'package:ddd_arch/infra/repository/user_repo_impl.dart' as _i15;
import 'package:ddd_arch/presentation/authen/login/blocs/login_bloc.dart'
    as _i13;
import 'package:ddd_arch/presentation/counter/cubit/counter_cubit.dart' as _i12;
import 'package:ddd_arch/presentation/home/blocs/home_bloc.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'locator.dart' as _i18;

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
  gh.factory<_i6.SettingBloc>(() => _i6.SettingBloc());
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i8.AppPreference>(
      () => _i8.AppPreference(gh<_i7.SharedPreferences>()));
  gh.singleton<_i9.AuthRepo>(_i10.AuthRepoImpl(gh<_i8.AppPreference>()));
  gh.singleton<_i11.AuthService>(_i11.AuthService(gh<_i9.AuthRepo>()));
  gh.factory<_i12.CounterBloc>(() => _i12.CounterBloc(
        gh<_i5.CounterService>(),
        gh<_i11.AuthService>(),
      ));
  gh.factory<_i13.LoginBloc>(() => _i13.LoginBloc(
        gh<_i11.AuthService>(),
        gh<_i3.AppNavigator>(),
      ));
  gh.singleton<_i14.UserRepo>(_i15.UserRepoImpl(gh<_i8.AppPreference>()));
  gh.singleton<_i16.ProfileService>(_i16.ProfileService(gh<_i14.UserRepo>()));
  gh.factory<_i17.HomeBloc>(() => _i17.HomeBloc(
        gh<_i11.AuthService>(),
        gh<_i16.ProfileService>(),
        gh<_i3.AppNavigator>(),
      ));
  return getIt;
}

class _$AppModule extends _i18.AppModule {}
