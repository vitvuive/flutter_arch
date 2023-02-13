import 'package:ddd_arch/presentation/app.dart';
import 'package:ddd_arch/bootstrap.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(() => const App());
}
