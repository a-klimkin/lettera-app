import 'package:flutter/material.dart';

import '../../entity/field_types.dart';

class ValueField extends StatelessWidget {
  final FieldTypes type;
  final RichText? child;
  final String? value;
  final Widget? action;

  const ValueField({
    super.key,
    required this.type,
    this.value,
    this.action,
    this.child,
  }) : assert((child == null && value != null) || (child != null && value == null));

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final titleColor = colorScheme.onSurface.withOpacity(0.38);
    final borderColor = colorScheme.onSurface.withOpacity(0.12);
    final valueColor = colorScheme.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: type.title,
            style: TextStyle(
              fontSize: 14,
              color: titleColor,
            ),
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                  child: Tooltip(
                    message: type.description,
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: titleColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            border: Border.fromBorderSide(
              BorderSide(
                color: borderColor,
                width: 1.0,
              ),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16.0, 2.0, 2.0, 2.0),
          child: Row(
            children: [
              Expanded(
                child: child ?? SelectableText(
                  value ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: valueColor,
                  ),
                ),
              ),
              if (action != null)
                action!,
            ],
          ),
        ),
      ],
    );
  }
}
