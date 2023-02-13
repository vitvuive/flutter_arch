import 'package:ddd_arch/data/repo_impl/login_counter_repo.dart';
import 'package:ddd_arch/data/repo_impl/logout_counter_repo.dart';
import 'package:ddd_arch/data/repository/auth_repo.dart';
import 'package:ddd_arch/domain/counter_log.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class CounterService {
  CounterService(this.loginCounterRepo, this.logoutCounterRepo, this.authRepo);

  final LoginCounterRepo loginCounterRepo;
  final LogoutCounterRepo logoutCounterRepo;
  final AuthRepo authRepo;

  Future<void> increase() async {
    final isLogin = authRepo.isLogin;

    if (isLogin) {
      await loginCounterRepo.increase();
    } else {
      await logoutCounterRepo.increase();
    }
  }

  Future<void> decrease() async {
    final isLogin = authRepo.isLogin;

    if (isLogin) {
      await loginCounterRepo.decrease();
    } else {
      await logoutCounterRepo.decrease();
    }
  }

  Stream<CounterLog> watch() {
    return authRepo.streamAuthState().flatMap((bool event) {
      if (event) {
        return loginCounterRepo.watchCounter();
      } else {
        return logoutCounterRepo.watchCounter();
      }
    });
  }
}
