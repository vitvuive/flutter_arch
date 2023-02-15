import 'package:ddd_arch/domain/models/counter_log.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class CounterService {
  CounterService(
      // this.loginCounterRepo,
      // this.logoutCounterRepo,
      // this.authRepo,
      );

  // final LoginCounterRepo loginCounterRepo;
  // final LogoutCounterRepo logoutCounterRepo;
  // final AuthRepo authRepo;

  Future<void> increase() async {
    // final isLogin = authRepo.isLogin;

    // if (isLogin) {
    //   await loginCounterRepo.increase();
    // } else {
    //   await logoutCounterRepo.increase();
    // }
  }

  Future<void> decrease() async {
    // final isLogin = authRepo.isLogin;

    // if (isLogin) {
    //   await loginCounterRepo.decrease();
    // } else {
    //   await logoutCounterRepo.decrease();
    // }
  }

  Stream<CounterLog> watch() {
    // return authRepo.streamAuthState().flatMap((bool event) {
    //   if (event) {
    //     return loginCounterRepo.watchCounter();
    //   } else {
    //     return logoutCounterRepo.watchCounter();
    //   }
    // });

    return BehaviorSubject.seeded(
      CounterLog(count: 1, lastUpdate: DateTime.now()),
    ).asBroadcastStream();
  }
}
