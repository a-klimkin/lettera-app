import 'dart:io';

import 'package:flutter/foundation.dart';

const double _defaultToolbarHeight = 80.0;

double get appToolbarHeight {
  if (kIsWeb) {
    return _defaultToolbarHeight;
  } else if (Platform.isMacOS) {
    return _defaultToolbarHeight + 24.0;
  } else {
    return _defaultToolbarHeight;
  }
}
