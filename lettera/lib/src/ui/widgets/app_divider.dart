import 'package:flutter/material.dart';

import '../../services/extensions/color_extension.dart';

class AppDivider extends StatelessWidget {
  final double indent;

  const AppDivider({
    super.key,
    this.indent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return DividerTheme(
      data: DividerThemeData(
        space: 48.0,
        thickness: 1,
        endIndent: indent,
        indent: indent,
        color: Theme.of(context).colorScheme.onSurface.disabled,
      ),
      child: const Divider(),
    );
  }
}
