import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/view/error_view.dart';
import 'package:flutter_revo_boilerplate/view/wizards_view.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/colors.dart';
import 'bottom_navigation.dart';

class AppRouterRouteInfo {
  final String value;
  final Object extra;

  AppRouterRouteInfo({required this.value, required this.extra});
}

enum AppRouterRoutes {
  initial,
  wizardTab,
  modalFull,
  modalSmall
}

extension AppRouter on AppRouterRoutes {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  AppRouterRouteInfo get value {
    switch (this) {
      case AppRouterRoutes.initial:
        return AppRouterRouteInfo(value: '/', extra: {});
      case AppRouterRoutes.modalFull:
        return AppRouterRouteInfo(value: '/${AppRouterRoutes.modalFull.name}', extra: {});
      case AppRouterRoutes.modalSmall:
        return AppRouterRouteInfo(value: '/${AppRouterRoutes.modalSmall.name}', extra: {});
      case AppRouterRoutes.wizardTab:
        return AppRouterRouteInfo(value: '/${AppRouterRoutes.wizardTab.name}', extra: {});
    }
  }

  static GoRouter getRouter(String initialLocation) {
    final shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');

    return GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const WizardView(),
        ),
        GoRoute(
          path: '/${AppRouterRoutes.modalFull.name}',
          pageBuilder: (context, state) => ModalPage(child: ErrorView(), fullPage: true),
        ),
        GoRoute(
          path: '/${AppRouterRoutes.modalSmall.name}',
          pageBuilder: (context, state) => ModalPage(child: ErrorView(), fullPage: false),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return CustomBottomNavigation(
                navigationShell: navigationShell
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: shellNavigatorAKey,
              routes: [
                GoRoute(
                  path: '/${AppRouterRoutes.wizardTab.name}',
                  pageBuilder: (context, state) => NoTransitionPage(
                    child: WizardView(),
                  ),
                  routes: [],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class ModalPage extends Page {
  final Widget child;
  final bool fullPage;

  const ModalPage({
    required this.child,
    required this.fullPage
  });

  @override
  Route createRoute(BuildContext context) => ModalBottomSheetRoute(
    settings: this,
    builder: (context) => Container(
      decoration: BoxDecoration(
        borderRadius: fullPage ? null : BorderRadius.only(
            topLeft: Radius.circular(Adaptive.px(20)),
            topRight: Radius.circular(Adaptive.px(20))
        ),
        color: MaterialColors.neutral.k100,
      ),
      child: fullPage ? child : Wrap(
        children: [
          child
        ],
      ),
    ),
    isDismissible: true,
    isScrollControlled: fullPage ? false : true,
    useSafeArea: false,
    enableDrag: fullPage ? false : true,
  );
}