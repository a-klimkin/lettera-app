part of 'cubit.dart';

enum SettingsStateStatus {
  initialized,
  fieldsChanged,
  parserChanged,
}

@immutable
class SettingsState {
  final SettingsStateStatus status;
  final List<FieldProperties> fields;
  final bool checkLatinLetters;
  final bool parseFromSnakeCase;
  final bool parseFromCamelCase;

  const SettingsState({
    this.status = SettingsStateStatus.initialized,
    this.fields = const [],
    this.checkLatinLetters = true,
    this.parseFromSnakeCase = false,
    this.parseFromCamelCase = false,
  });

  SettingsState copyWith({
    SettingsStateStatus? status,
    List<FieldProperties>? fields,
    bool? checkLatinLetters,
    bool? parseFromSnakeCase,
    bool? parseFromCamelCase,
  }) =>
      SettingsState(
        status: status ?? this.status,
        fields: fields ?? this.fields,
        checkLatinLetters: checkLatinLetters ?? this.checkLatinLetters,
        parseFromSnakeCase: parseFromSnakeCase ?? this.parseFromSnakeCase,
        parseFromCamelCase: parseFromCamelCase ?? this.parseFromCamelCase,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          fields == other.fields &&
          checkLatinLetters == other.checkLatinLetters &&
          parseFromSnakeCase == other.parseFromSnakeCase &&
          parseFromCamelCase == other.parseFromCamelCase;

  @override
  int get hashCode =>
      status.hashCode ^
      fields.hashCode ^
      checkLatinLetters.hashCode ^
      parseFromSnakeCase.hashCode ^
      parseFromCamelCase.hashCode;
}

extension SettingsStateStatusMap on SettingsStateStatus {
  void mapOrNull({
    VoidCallback? initialized,
    VoidCallback? fieldsChanged,
    VoidCallback? parserChanged,
  }) => switch (this) {
          SettingsStateStatus.initialized => initialized?.call(),
          SettingsStateStatus.fieldsChanged => fieldsChanged?.call(),
          SettingsStateStatus.parserChanged => parserChanged?.call(),
        };
}