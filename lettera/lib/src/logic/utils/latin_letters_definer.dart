import '../../entity/defined_text.dart';

final RegExp _latinRegexp = RegExp(r'[a-zA-Z]');
final RegExp _spaceRegexp = RegExp(r'\s');
final RegExp _symbolRegexp = RegExp(r'[.!&?/\\;:=-_+()*%$#@`]');
final RegExp _digitalRegexp = RegExp(r'\d');

class LatinLettersDefiner {

  /// Splits a string into parts containing Latin letters/symbols/spaces
  /// and parts containing non-Latin letters.
  static List<DefinedText> defineNonLatin(String value) {
    final letters = value.trim().split('');

    final startNonLetters = value.split('').indexWhere(
            (element) => !_match(element),
    );

    if (startNonLetters < 0) {
      return [DefinedText(value, isLatin: true)];
    } else {
      final endNonLetters = letters
          .sublist(startNonLetters)
          .indexWhere((element) => _match(element));

      final lastIndex = endNonLetters < 0 ? value.length : endNonLetters + startNonLetters;

      return [
        if (value.substring(0, startNonLetters).isNotEmpty)
          DefinedText(value.substring(0, startNonLetters), isLatin: true),
        DefinedText(value.substring(startNonLetters, lastIndex), isLatin: false),
        ...defineNonLatin(value.substring(lastIndex)),
      ];
    }
  }

  static bool _match(String value) =>
      _latinRegexp.hasMatch(value) ||
        _spaceRegexp.hasMatch(value) ||
        _symbolRegexp.hasMatch(value) ||
        _digitalRegexp.hasMatch(value);
}
