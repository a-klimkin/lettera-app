const String _lowCaseTitle = 'Lower case';
const String _upperCaseTitle = 'All caps';
const String _capitalizeFirstWordTitle = 'Capitalization word';
const String _capitalizeAllWordsTitle = 'Title case';
const String _capitalizeSentenceTitle = 'Sentence';
const String _camelCaseTitle = 'Camel case';
const String _fileNameTitle = 'Snake case';
const String _variableNameTitle = 'Lower camel case';
const String _latinLettersValidationTitle = 'No latin letters checker';

const String _lowCaseValue = 'lowercase';
const String _upperCaseValue = 'ALL CAPS';
const String _capitalizeFirstWordValue = 'Capitalization word';
const String _capitalizeAllWordsValue = 'Title Case';
const String _capitalizeSentenceValue = 'Sentence.';
const String _camelCaseValue = 'CamelCase';
const String _fileNameValue = 'snake_case';
const String _variableNameValue = 'lowerCamelCase';
const String _latinLettersValidationValue = '';

const String _lowCaseDescription = 'All letters in all words are lowercase.';
const String _upperCaseDescription = 'All letters in every word are capitalized. Used for extreme emphasis and considered rude when used over the Internet.';
const String _capitalizeFirstWordDescription = 'Writing the first letter of a word in uppercase, and the rest of the letters in lowercase.';
const String _capitalizeAllWordsDescription = 'The first letter of every word in uppercase, and the rest of the letters in lowercase.';
const String _capitalizeSentenceDescription = 'Writing the first letter of a word in uppercase after "." or "!" of "?"';
const String _camelCaseDescription = 'Words are written without spaces, and the first letter of each word is capitalized. Also called Upper Camel Case or Pascal Casing.';
const String _variableNameDescription = 'A variation of Camel Case in which the fist letter of the word is lowercase, e.g. iPhone, iPad, etc.';
const String _fileNameDescription = 'Punctuation is removed and spaces are replaced by a single underscore.';
const String _latinLettersValidationDescription = 'Check text for non-Latin characters.';

enum FieldTypes {
  lowCase(
    title: _lowCaseTitle,
    defaultValue: _lowCaseValue,
    description: _lowCaseDescription,
  ),
  upperCase(
    title: _upperCaseTitle,
    defaultValue: _upperCaseValue,
    description: _upperCaseDescription,
  ),
  capitalizeFirstWord(
    title: _capitalizeFirstWordTitle,
    defaultValue: _capitalizeFirstWordValue,
    description: _capitalizeFirstWordDescription,
  ),
  capitalizeAllWords(
    title: _capitalizeAllWordsTitle,
    defaultValue: _capitalizeAllWordsValue,
    description: _capitalizeAllWordsDescription,
  ),
  capitalizeSentence(
    title: _capitalizeSentenceTitle,
    defaultValue: _capitalizeSentenceValue,
    description: _capitalizeSentenceDescription,
  ),
  camelCase(
    title: _camelCaseTitle,
    defaultValue: _camelCaseValue,
    description: _camelCaseDescription,
  ),
  fileName(
    title: _fileNameTitle,
    defaultValue: _fileNameValue,
    description: _fileNameDescription,
  ),
  variableName(
    title: _variableNameTitle,
    defaultValue: _variableNameValue,
    description: _variableNameDescription,
  ),
  latinLettersValidation(
    title: _latinLettersValidationTitle,
    defaultValue: _latinLettersValidationValue,
    description: _latinLettersValidationDescription,
  );

  const FieldTypes({
    required this.title,
    required this.defaultValue,
    required this.description,
  });

  final String title;
  final String defaultValue;
  final String description;
}

class FieldType {
  static FieldTypes getFromString(String value) => FieldTypes.values.byName(value);
}
