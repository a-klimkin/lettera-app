part of 'cubit.dart';

@immutable
class MainState {
  final String initValue;
  final String lowCase;
  final String upperCase;
  final String capitalizeFirstWord;
  final String capitalizeAllWords;
  final String capitalizeSentence;
  final String camelCase;
  final String fileName;
  final String variableName;
  final List<DefinedText> nonLatinLetters;
  final List<FieldTypes> fields;
  final bool convertFromCamelCase;
  final bool convertFromSnakeCase;
  final bool checkLatinLetters;

  const MainState({
    this.initValue = '',
    this.lowCase = '',
    this.upperCase = '',
    this.capitalizeFirstWord = '',
    this.capitalizeAllWords = '',
    this.capitalizeSentence = '',
    this.camelCase = '',
    this.fileName = '',
    this.variableName = '',
    this.nonLatinLetters = const [],
    this.fields = const [],
    this.convertFromCamelCase = false,
    this.convertFromSnakeCase = false,
    this.checkLatinLetters = true,
  });

  String valueByFieldType(FieldTypes type) =>
      switch (type) {
        FieldTypes.lowCase => lowCase,
        FieldTypes.upperCase => upperCase,
        FieldTypes.capitalizeFirstWord => capitalizeFirstWord,
        FieldTypes.capitalizeAllWords => capitalizeAllWords,
        FieldTypes.capitalizeSentence => capitalizeSentence,
        FieldTypes.camelCase => camelCase,
        FieldTypes.fileName => fileName,
        FieldTypes.variableName => variableName,
        _ => '',
      };

  MainState copyWith({
    String? initValue,
    String? lowCase,
    String? upperCase,
    String? capitalizeFirstWord,
    String? capitalizeAllWords,
    String? capitalizeSentence,
    String? camelCase,
    String? fileName,
    String? variableName,
    List<DefinedText>? nonLatinLetters,
    List<FieldTypes>? fields,
    bool? convertFromCamelCase,
    bool? convertFromSnakeCase,
    bool? checkLatinLetters,
  }) => MainState(
          initValue: initValue ?? this.initValue,
          lowCase: lowCase ?? this.lowCase,
          upperCase: upperCase ?? this.upperCase,
          capitalizeFirstWord: capitalizeFirstWord ?? this.capitalizeFirstWord,
          capitalizeAllWords: capitalizeAllWords ?? this.capitalizeAllWords,
          capitalizeSentence: capitalizeSentence ?? this.capitalizeSentence,
          camelCase: camelCase ?? this.camelCase,
          fileName: fileName ?? this.fileName,
          variableName: variableName ?? this.variableName,
          nonLatinLetters: nonLatinLetters ?? this.nonLatinLetters,
          fields: fields ?? this.fields,
          convertFromCamelCase: convertFromCamelCase ?? this.convertFromCamelCase,
          convertFromSnakeCase: convertFromSnakeCase ?? this.convertFromSnakeCase,
          checkLatinLetters: checkLatinLetters ?? this.checkLatinLetters,
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainState &&
          runtimeType == other.runtimeType &&
          initValue == other.initValue &&
          lowCase == other.lowCase &&
          upperCase == other.upperCase &&
          capitalizeFirstWord == other.capitalizeFirstWord &&
          capitalizeAllWords == other.capitalizeAllWords &&
          capitalizeSentence == other.capitalizeSentence &&
          camelCase == other.camelCase &&
          fileName == other.fileName &&
          variableName == other.variableName &&
          nonLatinLetters == other.nonLatinLetters &&
          fields == other.fields &&
          convertFromCamelCase == other.convertFromCamelCase &&
          convertFromSnakeCase == other.convertFromSnakeCase &&
          checkLatinLetters == other.checkLatinLetters;

  @override
  int get hashCode =>
      initValue.hashCode ^
      lowCase.hashCode ^
      upperCase.hashCode ^
      capitalizeFirstWord.hashCode ^
      capitalizeAllWords.hashCode ^
      capitalizeSentence.hashCode ^
      camelCase.hashCode ^
      fileName.hashCode ^
      variableName.hashCode ^
      nonLatinLetters.hashCode ^
      fields.hashCode ^
      checkLatinLetters.hashCode ^
      convertFromCamelCase.hashCode ^
      convertFromSnakeCase.hashCode;

  @override
  String toString() {
    return 'MainState{initValue: $initValue, lowCase: $lowCase, upperCase: $upperCase, capitalizeFirstWord: $capitalizeFirstWord, capitalizeAllWords: $capitalizeAllWords, capitalizeSentence: $capitalizeSentence, camelCase: $camelCase, fileName: $fileName, variableName: $variableName, nonLatinLetters: $nonLatinLetters, fields: $fields, convertFromCamelCase: $convertFromCamelCase, convertFromSnakeCase: $convertFromSnakeCase, checkLatinLetters: $checkLatinLetters}';
  }
}