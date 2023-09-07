RegExp _space = RegExp(r'\s+');

mixin TextConvertorMixin {
  String toLowCase(String value) => value.trim().toLowerCase();

  String toUpCase(String value) => value.trim().toUpperCase();

  String capitalizeFirstWord(String value) =>
      _wordToUpperCase(value.trim().toLowerCase());

  String capitalizeAllWords(String value) {
    final words = _toWords(value);
    final buff = StringBuffer();

    for (final s in words) {
      buff
        ..write(_wordToUpperCase(s))
        ..write(' ');
    }

    return buff.toString().trim();
  }

  String capitalizeAsSentenceWord(String value) => _wordToUpperCase(
      value
          .trim()
          .splitMapJoin(RegExp(r'\s*[.||?||!]\s+[a-z]'), onMatch: (s) => s[0]!.toUpperCase()),
    );

  String toCamelCase(String value) {
    final words = _toWords(value);
    final buff = StringBuffer();

    for (final s in words) {
      buff.write(_wordToUpperCase(s));
    }

    return buff.toString().trim();
  }

  String tofileName(String value) =>
      value.trim().toLowerCase().split(_space).join('_');

  String toVariableName(String value) {
    final words = _toWords(value);
    final buff = StringBuffer(words[0]);

    for (int i = 1; i < words.length; i++) {
      buff.write(_wordToUpperCase(words[i]));
    }

    return buff.toString();
  }

  List<String> _toWords(String value) =>
      value.trim().toLowerCase().split(_space);

  String fromSnakeCase(String value) {
    if (value.trim().contains(_space)) {
      return value;
    }

    return value.replaceAll('_', ' ').trim();
  }
  
  String fromCamelCase(String value) {
    if (value.trim().contains(_space)) {
      return value;
    }

    return value
        .splitMapJoin(RegExp(r'[A-Z]'), onMatch: (s) => ' ${s[0]}')
        .trim();
  }

  String _wordToUpperCase(String value) {
    if (value.isEmpty) {
      return value;
    }

    final first = value.substring(0,1);
    return value.replaceFirst(first, first.toUpperCase());
  }
}
