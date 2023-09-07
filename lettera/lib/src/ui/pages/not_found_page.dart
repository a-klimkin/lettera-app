import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/app_tool_bar.dart';

@RoutePage()
class NotFoundPage extends StatelessWidget {
  static const String path = '/*';
  static TitleBuilder title = (context, data) => '404';

  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolBar(),
      body: const Center(
        child: Text(
          'Oops! Not found',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}