import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import 'app_logo.dart';

class AppToolBar extends AppBar {
  AppToolBar() : super(
    key: UniqueKey(),
    title: const AppLogo(),
    automaticallyImplyLeading: false,
    centerTitle: false,
    toolbarHeight: appToolbarHeight,
  );

  AppToolBar.main({
    required VoidCallback onDownload,
    required VoidCallback onSettings,
  }) : super(
    key: UniqueKey(),
    title: const AppLogo(),
    automaticallyImplyLeading: false,
    centerTitle: false,
    toolbarHeight: appToolbarHeight,
    actions: [
      if (kIsWeb)
        TextButton(
          onPressed: onDownload,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.file_download_outlined),
              SizedBox(width: 8),
              Text('Download'),
            ],
          ),
        ),
      const SizedBox(width: 12),
      TextButton(
        onPressed: onSettings,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.settings_outlined),
            SizedBox(width: 8),
            Text('Settings'),
          ],
        ),
      ),
      const SizedBox(width: 24),
    ],
  );
}