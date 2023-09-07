import 'package:flutter/material.dart';

import 'app.dart';
import 'src/config/configure_desctop.dart'
    if (dart.library.html) 'src/config/configure_web.dart';
import 'src/config/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dependencies.init();

  await configureApp();

  runApp(const App());
}