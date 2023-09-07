import 'package:flutter/material.dart';

import 'app_switch.dart';

class ParseSetupSettingsComponent extends StatelessWidget {
  final bool fromCamelCase;
  final bool fromFromCase;
  final ValueChanged<bool> changeFromCamelCase;
  final ValueChanged<bool> changeFromSnakeCase;

  const ParseSetupSettingsComponent({
    super.key,
    required this.fromCamelCase,
    required this.fromFromCase,
    required this.changeFromCamelCase,
    required this.changeFromSnakeCase,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: AppSwitch(
            label: 'Camel case revers parse',
            tooltip: 'Allow automatic detection of whether the text is completely written in Camel case and translate it into a regular test.\nExample: CamelCase -> camel case;\nIf a text contains regular type text, the text would not change.\nExample: Some text with CamelCase -> Some text with CamelCase',
            value: fromCamelCase,
            onChanged: changeFromCamelCase,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: AppSwitch(
            label: 'Snake case revers parse',
            tooltip: 'Allow automatic detection of whether the text is completely written in Snake case and translate it into a regular test.\nExample: snake_case -> snake case;\nIf a text contains regular type text, the text would not change.\nExample: Some text with snake_case -> Some text with snake_case',
            value: fromFromCase,
            onChanged: changeFromSnakeCase,
          ),
        ),
      ],
    );
  }
}
