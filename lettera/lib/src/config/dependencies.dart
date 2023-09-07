import 'package:get_it/get_it.dart';

import '../services/local_storage.dart';

final GetIt services = GetIt.instance;

mixin Dependencies {
  static Future<void> init() async {
    final LocalStorage storage = await LocalStorage().init();

    _app(
      storage: storage,
    );
  }

  static void _app({
    required LocalStorage storage,
  }) {
    services.registerSingleton(storage);
  }
}
