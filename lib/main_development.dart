import 'package:ddd_arch/bootstrap.dart';
import 'package:ddd_arch/presentation/app.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(() => const App());
}
