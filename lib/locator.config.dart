// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ddd_arch/application/auth_service.dart' as _i5;
import 'package:ddd_arch/application/counter_service.dart' as _i8;
import 'package:ddd_arch/data/repo_impl/auth_repo_repo.dart' as _i4;
import 'package:ddd_arch/data/repo_impl/login_counter_repo.dart' as _i6;
import 'package:ddd_arch/data/repo_impl/logout_counter_repo.dart' as _i7;
import 'package:ddd_arch/data/repository/auth_repo.dart' as _i3;
import 'package:ddd_arch/presentation/counter/cubit/counter_cubit.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AuthRepo>(_i4.AuthRepoImpl());
  gh.singleton<_i5.AuthService>(_i5.AuthService(gh<_i3.AuthRepo>()));
  gh.singleton<_i6.LoginCounterRepo>(
    _i6.LoginCounterRepo(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i7.LogoutCounterRepo>(
    _i7.LogoutCounterRepo(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i8.CounterService>(_i8.CounterService(
    gh<_i6.LoginCounterRepo>(),
    gh<_i7.LogoutCounterRepo>(),
    gh<_i3.AuthRepo>(),
  ));
  gh.factory<_i9.CounterBloc>(() => _i9.CounterBloc(
        gh<_i8.CounterService>(),
        gh<_i5.AuthService>(),
      ));
  return getIt;
}
