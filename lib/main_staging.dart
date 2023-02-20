import 'package:ddd_arch/bootstrap.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
