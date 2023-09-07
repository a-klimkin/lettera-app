import 'package:firebase_core/firebase_core.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import '_firebase.dart';

Future<void> configureApp() async {
  setUrlStrategy(PathUrlStrategy());

  await Firebase.initializeApp(options: appOptions);
}
