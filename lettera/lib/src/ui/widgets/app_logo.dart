import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/route/app_router.gr.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(const MainRoute()),
      borderRadius: const BorderRadius.all(Radius.circular(28.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        child: SvgPicture.asset(
          height: 36.0,
          'assets/images/lettera_logo.svg',
          semanticsLabel: 'lettera logo',
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onSurface.withOpacity(0.87),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
