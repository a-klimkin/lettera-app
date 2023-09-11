enum FieldTypes {
  lowCase,
  upperCase,
  capitalizeFirstWord,
  capitalizeAllWords,
  capitalizeSentence,
  camelCase,
  fileName,
  variableName,
  latinLettersValidation,
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
  FieldTypes.variableName,
];

class FieldType {
  static FieldTypes getFromString(String value) => FieldTypes.values.byName(value);
}

extension FieldTypesExtension on FieldTypes {
  String get title => switch (this) {
    FieldTypes.lowCase => 'Lower case',
    FieldTypes.upperCase => 'All caps',
    FieldTypes.capitalizeFirstWord => 'Capitalization word',
    FieldTypes.capitalizeAllWords => 'Title case',
    FieldTypes.capitalizeSentence => 'Sentence',
    FieldTypes.camelCase => 'Camel case',
    FieldTypes.fileName => 'Snake case',
    FieldTypes.variableName => 'Lower camel case',
    FieldTypes.latinLettersValidation => 'No latin letters checker',
  };

  String get defaultValue => switch (this) {
    FieldTypes.lowCase => 'lowercase',
    FieldTypes.upperCase => 'ALL CAPS',
    FieldTypes.capitalizeFirstWord => 'Capitalization word',
    FieldTypes.capitalizeAllWords => 'Title Case',
    FieldTypes.capitalizeSentence => 'Sentence.',
    FieldTypes.camelCase => 'CamelCase',
    FieldTypes.fileName => 'snake_case',
    FieldTypes.variableName => 'lowerCamelCase',
    FieldTypes.latinLettersValidation => '',
  };

  String get description => switch (this) {
    FieldTypes.lowCase => 'All letters in all words are lowercase.',
    FieldTypes.upperCase => 'All letters in every word are capitalized. Used for extreme emphasis and considered rude when used over the Internet.',
    FieldTypes.capitalizeFirstWord => 'Writing the first letter of a word in uppercase, and the rest of the letters in lowercase.',
    FieldTypes.capitalizeAllWords => 'The first letter of every word in uppercase, and the rest of the letters in lowercase.',
    FieldTypes.capitalizeSentence => 'Writing the first letter of a word in uppercase after "." or "!" of "?"',
    FieldTypes.camelCase => 'Words are written without spaces, and the first letter of each word is capitalized. Also called Upper Camel Case or Pascal Casing.',
    FieldTypes.variableName => 'A variation of Camel Case in which the fist letter of the word is lowercase, e.g. iPhone, iPad, etc.',
    FieldTypes.fileName => 'Punctuation is removed and spaces are replaced by a single underscore.',
    FieldTypes.latinLettersValidation => 'Check text for non-Latin characters.',
  };
}
