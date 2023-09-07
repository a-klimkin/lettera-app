import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entity/field_properties.dart';
import '../utils/text_convertor.dart';
import '../../entity/field_types.dart';

part 'state.dart';

class MainCubit extends Cubit<MainState> with TextConvertorMixin {
  MainCubit() : super(const MainState());

  void initFields(List<FieldProperties> fieldsProperties) {
    final fields = fieldsProperties
        .where((field) => field.visible)
        .map((field) => field.type)
        .toList();

    emit(MainState(fields: fields));
  }

  void onChangeValue(String value) {
    if (value.isEmpty) {
      clear();
    } else {
      String line = value;

      if (state.convertFromCamelCase) {
        line = fromCamelCase(line);
      }

      if (state.convertFromSnakeCase) {
        line = fromSnakeCase(line);
      }

      emit(
        state.copyWith(
          initValue: line,
          lowCase: toLowCase(line),
          upperCase: toUpCase(line),
          capitalizeFirstWord: capitalizeFirstWord(line),
          capitalizeAllWords: capitalizeAllWords(line),
          capitalizeSentence: capitalizeAsSentenceWord(line),
          camelCase: toCamelCase(line),
          fileName: tofileName(line),
          variableName: toVariableName(line),
        ),
      );
    }
  }

  void clear() => emit(MainState(fields: state.fields));

  void setupSettings({
    bool? fromCamelCase,
    bool? fromSnakeCase,
  }) => emit(
      MainState(
        fields: state.fields,
        convertFromCamelCase: fromCamelCase ?? state.convertFromCamelCase,
        convertFromSnakeCase: fromSnakeCase ?? state.convertFromSnakeCase,
      ),
    );
}