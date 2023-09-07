import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/app_tool_bar.dart';

@RoutePage()
class DownloadPage extends StatelessWidget {
  static const String path = '/download';
  static TitleBuilder title = (context, data) => 'Download app';

  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolBar(),
      body: Center(child: Text('Download app')),
    );
  }
}