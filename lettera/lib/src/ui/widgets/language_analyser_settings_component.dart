import 'package:flutter/material.dart';

import '_index.dart';

class LanguageAnalyserSettingsComponent extends StatelessWidget {
  final bool checkLatinLetters;
  final ValueChanged<bool>? onCheckLatinChanged;

  const LanguageAnalyserSettingsComponent({
    super.key,
    required this.checkLatinLetters,
    required this.onCheckLatinChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: AppSwitch(
            label: 'Check non latin letters',
            tooltip: 'Allow automatic detection non latin letters in text.',
            value: checkLatinLetters,
            onChanged: onCheckLatinChanged,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 8.0),
        //   child: AppSwitch(
        //     label: 'Snake case revers parse',
        //     tooltip: 'Allow automatic detection of whether the text is completely written in Snake case and translate it into a regular test.\nExample: snake_case -> snake case;\nIf a text contains regular type text, the text would not change.\nExample: Some text with snake_case -> Some text with snake_case',
        //     value: fromFromCase,
        //     onChanged: changeFromSnakeCase,
        //   ),
        // ),
      ],
    );
  }
}
