import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../config/constants.dart';
import '../config/palette.dart';
import '../entity/field_properties.dart';

class LocalStorage {
  late SharedPreferences _prefs;

  LocalStorage();

  Future<LocalStorage> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  List<FieldProperties> get fieldPropertiesList {
    if (_prefs.containsKey('fieldPropertiesList')) {
      final list = json.decode(_prefs.getString('fieldPropertiesList') ?? '');
      return List<FieldProperties>.from(list.map((e) => FieldProperties.fromJson(e)));
    } else {
      return defaultFieldPropertiesList;
    }
  }

  set fieldPropertiesList(List<FieldProperties> list) {
    final json = jsonEncode(list, toEncodable: (e) => (e as FieldProperties).toJson());
    _prefs.setString('fieldPropertiesList', json);
  }

  bool get parseFromCamelCase => _prefs.getBool('parseFromCamelCase') ?? defaultFromCamelCase;

  set parseFromCamelCase(bool value) => _prefs.setBool('parseFromCamelCase', value);

  bool get parseFromSnakeCase => _prefs.getBool('parseFromSnakeCase') ?? defaultFromSnakeCase;

  set parseFromSnakeCase(bool value) => _prefs.setBool('parseFromSnakeCase', value);

  bool get checkLatinLetters => _prefs.getBool('checkLatinLetters') ?? defaultLatinLettersChecker;

  set checkLatinLetters(bool value) => _prefs.setBool('checkLatinLetters', value);

  int get colorSchemeSeed => _prefs.getInt('colorSchemeSeed') ?? Palette.blackPearl.value;

  set colorSchemeSeed(int value) => _prefs.setInt('colorSchemeSeed', value);

  String? get themeBrightness => _prefs.getString('themeBrightness');

  setThemeBrightness(String value) => _prefs.setString('themeBrightness', value);
}