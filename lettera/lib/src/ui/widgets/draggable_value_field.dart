import 'package:flutter/material.dart';

import '../../entity/field_properties.dart';
import '../../entity/field_types.dart';
import '../../services/extensions/color_extension.dart';
import 'value_field.dart';

class DraggableValueField extends StatelessWidget {
  final FieldProperties fieldProperties;
  final VoidCallback onVisibleChange;

  const DraggableValueField({
    super.key,
    required this.fieldProperties,
    required this.onVisibleChange,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.primary;
    final defaultColor = colorScheme.onSurface.disabled;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Expanded(
            child: ValueField(
              value: fieldProperties.type.defaultValue,
              type: fieldProperties.type,
              action: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                onTap: onVisibleChange,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    fieldProperties.visible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: fieldProperties.visible
                        ? iconColor
                        : defaultColor,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 28.0, 12.0, 0.0),
            child: Icon(
              Icons.drag_indicator_rounded,
              color: defaultColor,
            ),
          ),
        ],
      ),
    );
  }
}
