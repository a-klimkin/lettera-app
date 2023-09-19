import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants.dart';
import '../../config/dependencies.dart';
import '../../entity/field_properties.dart';
import '../../services/local_storage.dart';

part 'state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void init() {
    final storage = services.get<LocalStorage>();

    emit(
      SettingsState(
        status: SettingsStateStatus.initialized,
        fields: storage.fieldPropertiesList,
        checkLatinLetters: storage.checkLatinLetters,
        parseFromSnakeCase: storage.parseFromSnakeCase,
        parseFromCamelCase: storage.parseFromCamelCase,
      ),
    );
  }

  void changeFromSnakeCase(bool value) {
    emit(
      state.copyWith(
        status: SettingsStateStatus.parserChanged,
        parseFromSnakeCase: value,
      ),
    );

    services.get<LocalStorage>().parseFromSnakeCase = value;
  }

  void changeFromCamelCase(bool value) {
    emit(
      state.copyWith(
        status: SettingsStateStatus.parserChanged,
        parseFromCamelCase: value,
      ),
    );

    services.get<LocalStorage>().parseFromCamelCase = value;
  }

  void changeFieldVisible(FieldProperties field) {
    final newField = FieldProperties(field.type, visible: !field.visible);
    final list = state.fields
        .map((e) => e.type == field.type ? newField : e)
        .toList();

    _updateState(list);
  }


  void onCheckLatinChanged(bool value) {
    emit(
      state.copyWith(
        status: SettingsStateStatus.parserChanged,
        checkLatinLetters: value,
      ),
    );

    services.get<LocalStorage>().checkLatinLetters = value;
  }

  void changeFieldPosition(int oldIndex, int newIndex) {
    final list = state.fields;
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);

    emit(
      state.copyWith(
        fields: [],
      ),
    );

    _updateState(list);
  }

  void resetSettings() {
    _updateState(defaultFieldPropertiesList);

    emit(
      state.copyWith(
        status: SettingsStateStatus.parserChanged,
        parseFromCamelCase: defaultFromCamelCase,
        parseFromSnakeCase: defaultFromSnakeCase,
        checkLatinLetters: defaultLatinLettersChecker,
      ),
    );

    services.get<LocalStorage>()
      ..parseFromCamelCase = defaultFromCamelCase
      ..parseFromSnakeCase = defaultFromSnakeCase
      ..checkLatinLetters = defaultLatinLettersChecker;
  }

  void _updateState(List<FieldProperties> list) {
    emit(
      state.copyWith(
        status: SettingsStateStatus.fieldsChanged,
        fields: list,
      ),
    );

    services.get<LocalStorage>().fieldPropertiesList = list;
  }
}