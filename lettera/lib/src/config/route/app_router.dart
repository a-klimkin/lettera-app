import 'package:auto_route/auto_route.dart';

import '../../ui/pages/download_page.dart';
import '../../ui/pages/not_found_page.dart';
import '../../ui/pages/settings_page.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(generateForDir: ['lib/src'])
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes =>
      [
        AdaptiveRoute(
          page: MainRoute.page,
          initial: true,
          usesPathAsKey: true,
        ),
        AdaptiveRoute(
          page: DownloadRoute.page,
          path: DownloadPage.path,
          title: DownloadPage.title,
          usesPathAsKey: true,
        ),
        AdaptiveRoute(
          page: SettingsRoute.page,
          path: SettingsPage.path,
          title: SettingsPage.title,
          usesPathAsKey: true,
        ),
        AdaptiveRoute(
          page: NotFoundRoute.page,
          path: NotFoundPage.path,
          title: NotFoundPage.title,
        ),
      ];
}