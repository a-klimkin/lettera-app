import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../entity/field_types.dart';
import 'value_field.dart';

class DisplayValueField extends StatelessWidget {
  final FieldTypes type;
  final String? value;

  const DisplayValueField({
    super.key,
    required this.value,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final borderColor = colorScheme.onSurface.withOpacity(0.12);
    final iconColor = colorScheme.primary;
    final bool hasValue = value?.isNotEmpty ?? false;

    return ValueField(
      value: value,
      type: type,
      action: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        onTap: hasValue
            ? () => Clipboard.setData(ClipboardData(text: value ?? ''))
            : null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 13.0, 12.0, 11.0),
          child: Icon(
            Icons.copy_all_outlined,
            color: hasValue
                ? iconColor
                : borderColor,
          ),
        ),
      ),
    );
  }
}
