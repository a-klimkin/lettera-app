import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../config/route/app_router.gr.dart';

class AppNavigationRow extends StatelessWidget {
  final String pageName;
  final Widget? action;

  const AppNavigationRow(this.pageName, {super.key, this.action});

  const AppNavigationRow.settings({super.key, this.action}) : pageName = 'Settings';

  void _onWillPop(BuildContext context) {
    final navigator = context.router;
    if (navigator.canPop()) {
      navigator.pop();
    } else {
      navigator.replace(const MainRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface.withOpacity(0.87);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BackButton(
            color: color,
            onPressed: () => _onWillPop(context),
          ),
          Text(
            pageName,
            style: TextStyle(
              fontSize: 24,
              color: color,
            ),
          ),
          if (action != null) ...[
            const Spacer(),
            action!,
          ],
        ],
      ),
    );
  }
}
