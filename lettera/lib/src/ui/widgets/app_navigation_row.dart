import 'package:flutter/material.dart';

class AppNavigationRow extends StatelessWidget {
  final String pageName;

  const AppNavigationRow(this. pageName, {super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface.withOpacity(0.87);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BackButton(
          color: color,
        ),
        Text(
          pageName,
          style: TextStyle(
            fontSize: 24,
            color: color,
          ),
        )
      ],
    );
  }
}
