import 'package:flutter_test/flutter_test.dart';
import 'package:lettera/src/logic/utils/latin_letters_definer.dart';


void main() {
  group('Testing LatinLettersDefiner', () {

    test('Testing empty text', () {
      final testValue = LatinLettersDefiner.defineNonLatin('');

      expect(
        testValue.length,
        1,
      );

      expect(
        testValue.first.value,
        '',
      );
    });

    test('Testing normal latin text', () {
      const value = 'Application can a bit modify text for your needs';
      final testValue = LatinLettersDefiner.defineNonLatin(value);

      expect(
        testValue.length,
        1,
      );

      expect(
        testValue.first.value,
        value,
      );
    });

    test('Testing web link', () {
      const value = 'https://github.com/flutter/flutter.git';
      final testValue = LatinLettersDefiner.defineNonLatin(value);

      expect(
        testValue.length,
        1,
      );

      expect(
        testValue.first.value,
        value,
      );
    });

    test('Testing text with one wrong letter in the middle', () {
      const value = 'Application can Ы a bit modify text for your needs';
      final testValue = LatinLettersDefiner.defineNonLatin(value);

      expect(
        testValue.length,
        3,
      );

      expect(
        testValue.map((e) => e.value).join(),
        value,
      );

      expect(
        testValue[1].isLatin,
        false,
      );

      expect(
        testValue[1].value,
        'Ы',
      );
    });

    test('Testing text with one wrong letter at the start', () {
      const value = 'Ы Application can a bit modify text for your needs';
      final testValue = LatinLettersDefiner.defineNonLatin(value);

      expect(
        testValue.length,
        2,
      );

      expect(
        testValue.map((e) => e.value).join(),
        value,
      );

      expect(
        testValue[0].isLatin,
        false,
      );

      expect(
        testValue[0].value,
        'Ы',
      );
    });

    test('Testing text with one wrong letters', () {
      const value = 'Familie Müller plant ihren Urlaub. Sie geht in ein Reisebüro und lässt sich von einem Angestellten beraten.';
      final testValue = LatinLettersDefiner.defineNonLatin(value);

      expect(
        testValue.length,
        7,
      );

      expect(
        testValue.map((e) => e.value).join(),
        value,
      );

      expect(
        testValue[1].isLatin,
        false,
      );

      expect(
        testValue[1].value,
        'ü',
      );

      expect(
        testValue[3].isLatin,
        false,
      );

      expect(
        testValue[3].value,
        'ü',
      );

      expect(
        testValue[5].isLatin,
        false,
      );

      expect(
        testValue[5].value,
        'ä',
      );
    });
  });
}
