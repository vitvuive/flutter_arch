import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class NetworkManager {
  NetworkManager();
  bool _isConnected = false;

  final disposables = CompositeSubscription();

  final connect = Connectivity();

  final _streamIsConnect = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get streamIsConnect =>
      _streamIsConnect.distinct().asBroadcastStream();

  Future<void> init() async {
    await checkConnection();

    final stream = connect.onConnectivityChanged.asBroadcastStream();
    stream.listen((event) async {
      await checkConnection();
    }).addTo(disposables);
  }

  Future<void> checkConnection() async {
    final connectivity = await connect.checkConnectivity();

    if ([ConnectivityResult.wifi, ConnectivityResult.mobile]
        .contains(connectivity)) {
      final haveConnection = await InternetConnectionChecker().hasConnection;
      _isConnected = haveConnection;
      _streamIsConnect.add(haveConnection);
    } else {
      _isConnected = false;
      _streamIsConnect.add(false);
    }
  }

  @disposeMethod
  void dispose() {
    disposables.clear();
  }

  bool get isConnected => _isConnected;
}
