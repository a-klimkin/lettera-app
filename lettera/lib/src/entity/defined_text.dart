class DefinedText {
  final String value;
  final bool isLatin;

  DefinedText(this.value, {required this.isLatin});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DefinedText &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          isLatin == other.isLatin;

  @override
  int get hashCode => value.hashCode ^ isLatin.hashCode;

  @override
  String toString() {
    return 'DefinedText{value: $value, isLatin: $isLatin}';
  }
}
