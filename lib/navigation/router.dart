import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/view/error_view.dart';
import 'package:flutter_revo_boilerplate/view/wizards_view.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/colors.dart';

class AppRouterRouteInfo {
  final String value;
  final Object extra;

  AppRouterRouteInfo({required this.value, required this.extra});
}

enum AppRouterRoutes {
  initial,
  home,
  modalFull,
  modalSmall
}

extension AppRouter on AppRouterRoutes {
  AppRouterRouteInfo get value {
    switch (this) {
      case AppRouterRoutes.initial:
        return AppRouterRouteInfo(value: '/', extra: {});
      case AppRouterRoutes.home:
        return AppRouterRouteInfo(value: '/home', extra: {});
      case AppRouterRoutes.modalFull:
        return AppRouterRouteInfo(value: '/modalFull', extra: {});
      case AppRouterRoutes.modalSmall:
        return AppRouterRouteInfo(value: '/modalSmall', extra: {});
      default:
        return AppRouterRouteInfo(value: '/', extra: {});
    }
  }

  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const WizardView(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const WizardView(),
        ),
        GoRoute(
          path: '/modalFull',
          pageBuilder: (context, state) => ModalPage(child: ErrorView(), fullPage: true),
        ),
        GoRoute(
          path: '/modalSmall',
          pageBuilder: (context, state) => ModalPage(child: ErrorView(), fullPage: false),
        ),
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
        color: CustomColors.neutral(CustomNeutralKeys.k100),
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