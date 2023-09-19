import 'package:flutter/material.dart';

import '../../services/extensions/color_extension.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.tooltip,
  });

  final String label;
  final String? tooltip;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(width: 16),
        SelectableText(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.87),
          ),
        ),
        if (tooltip != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 2.0),
            child: Tooltip(
              message: tooltip,
              child: Icon(
                Icons.info_outline_rounded,
                color: Theme.of(context).colorScheme.onSurface.lighter,
                size: 16,
              ),
            ),
          )
      ],
    );
  }
}
