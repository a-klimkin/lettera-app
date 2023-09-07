import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/dependencies.dart';
import '../../config/palette.dart';
import '../../services/local_storage.dart';

final _defaultTheme = ThemeData(
  fontFamily: 'Roboto',
  useMaterial3: true,
  brightness: Brightness.dark,
  colorSchemeSeed: Palette.blackPearl,
);

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_defaultTheme);

  void initTheme() {
    final brightnessData = services.get<LocalStorage>().themeBrightness
        ?? PlatformDispatcher.instance.platformBrightness.name;

    final brightness = Brightness.values.byName(brightnessData);

    final color = Color(services.get<LocalStorage>().colorSchemeSeed);

    emit(
      ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        brightness: brightness,
        colorSchemeSeed: color,
      ),
    );
  }

  void toggleTheme() {
    final brightness = state.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;

    final color = services.get<LocalStorage>().colorSchemeSeed == Palette.blackPearl.value
        ? Palette.indigo
        : Palette.blackPearl;

    services.get<LocalStorage>().setThemeBrightness(brightness.name);
    services.get<LocalStorage>().colorSchemeSeed = color.value;

    emit(
      ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        brightness: brightness,
        colorSchemeSeed: color,
      ),
    );
  }
}