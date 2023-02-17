import 'package:bloc/bloc.dart';
import 'package:ddd_arch/domain/models/counter_log/counter_log.dart';
import 'package:ddd_arch/service/auth_service.dart';
import 'package:ddd_arch/service/counter_service.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(this.counterService, this.authService)
      : super(
          CounterState(
            counterLog: CounterLog(count: 0, lastUpdate: DateTime.now()),
          ),
        ) {
    on<RequestSubmitStream>(_requestSubmit);
    on<Add>(_add);
    on<Sub>(_sub);
    on<Login>(_login);
    on<Logout>(_logout);

    add(RequestSubmitStream());
  }

  final CounterService counterService;

  final AuthService authService;

  Future<void> _requestSubmit(
    RequestSubmitStream event,
    Emitter<CounterState> emit,
  ) async {
    // return emit.forEach(
    //     Rx.combineLatest2(
    //         counterService.watch(), authService.authRepo.streamAuthState(),
    //         (a, b) {
    //       return [a, b];
    //     }), onData: (List<dynamic> list) {
    //   return state.copy(
    //     counterLog: list[0] as CounterLog,
    //     isLogin: () => list[1] as bool,
    //   );
    // });
  }

  Future<void> _add(
    Add event,
    Emitter<CounterState> emit,
  ) async {
    // await counterService.increase();
  }

  Future<void> _sub(
    Sub event,
    Emitter<CounterState> emit,
  ) async {
    // await counterService.decrease();
  }

  Future<void> _login(
    Login event,
    Emitter<CounterState> emit,
  ) async {
    // await authService.login();
  }

  Future<void> _logout(
    Logout event,
    Emitter<CounterState> emit,
  ) async {
    await authService.logout();
  }
}

class CounterState extends Equatable {
  const CounterState({
    required this.counterLog,
    this.isLogin = false,
  });

  final CounterLog counterLog;
  final bool isLogin;

  CounterState copy({
    CounterLog? counterLog,
    bool Function()? isLogin,
  }) {
    return CounterState(
      counterLog: counterLog ?? this.counterLog,
      isLogin: isLogin != null ? isLogin.call() : this.isLogin,
    );
  }

  @override
  List<Object?> get props => [counterLog, isLogin];
}

class CounterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RequestSubmitStream extends CounterEvent {}

class Add extends CounterEvent {}

class Sub extends CounterEvent {}

class Login extends CounterEvent {}

class Logout extends CounterEvent {}
