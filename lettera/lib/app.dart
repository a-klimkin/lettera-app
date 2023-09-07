import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/providers.dart';
import 'src/config/route/app_router.dart';
import 'src/logic/theme_cubit/cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter appRoute;

  @override
  void initState() {
    super.initState();
    appRoute = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CubitProviders.providers,
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            title: 'lettera',
            routerDelegate: appRoute.delegate(),
            routeInformationProvider: appRoute.routeInfoProvider(),
            routeInformationParser: appRoute.defaultRouteParser(),
            theme: theme,
          );
        },
      ),
    );
  }
}