import 'dart:io';

import 'package:flutter/foundation.dart';

import '../entity/field_properties.dart';
import '../entity/field_types.dart';

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

const List<FieldTypes> defaultFieldsOrder = [
  FieldTypes.lowCase,
  FieldTypes.upperCase,
  FieldTypes.capitalizeFirstWord,
  FieldTypes.capitalizeAllWords,
  FieldTypes.capitalizeSentence,
  FieldTypes.camelCase,
  FieldTypes.fileName,
  FieldTypes.variableName,
];

List<FieldProperties> get defaultFieldPropertiesList =>
    defaultFieldsOrder.map((type) => FieldProperties(type)).toList();

const bool defaultFromCamelCase = false;

const bool defaultFromSnakeCase = false;

const bool defaultLatinLettersChecker = true;

const double mainPadding = 24.0;
