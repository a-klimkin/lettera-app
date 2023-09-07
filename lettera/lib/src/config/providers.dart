import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/main_cubit/cubit.dart';
import '../logic/settings_cubit/cubit.dart';
import '../logic/theme_cubit/cubit.dart';
import '../services/local_storage.dart';
import 'dependencies.dart';

class CubitProviders {
  CubitProviders._();

  static final LocalStorage storage = services.get<LocalStorage>();

  static List<BlocProvider> get providers => [
    BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..initTheme()),
    BlocProvider<MainCubit>(create: (context) => MainCubit()..initFields(storage.fieldPropertiesList)),
    BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()..init()),
  ];
}