import 'package:flutter/material.dart';

import '../../entity/defined_text.dart';
import '../../entity/field_types.dart';
import '../../services/extensions/color_extension.dart';
import 'value_field.dart';

class NonLatinLettersField extends StatelessWidget {
  final List<DefinedText> definedTextList;

  const NonLatinLettersField({
    super.key,
    required this.definedTextList,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.onSurface;
    final errorBackgroundColor = colorScheme.errorContainer;
    final borderColor = colorScheme.onSurface.disabled;

    final value = definedTextList.map((e) => e.value).join();
    final bool hasValue = value.isNotEmpty;
    final displayText = hasValue ? value : 'No text to check';

    return Row(
      children: [
        Expanded(
          child: Text(
            displayText,
            style: TextStyle(
              fontSize: 14,
              color: hasValue ? textColor : borderColor,
            ),
          ),
        ),
        Expanded(
          child: ValueField(
            type: FieldTypes.latinLettersValidation,
            child: RichText(
              text: TextSpan(
                children: definedTextList
                    .map((e) => TextSpan(
                        text: e.value,
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          backgroundColor: e.isLatin ? Colors.transparent : errorBackgroundColor,
                        ),
                      ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
