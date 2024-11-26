import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../app/di.dart';

import '../../../presentation/login/login_screen.dart';

import '../../../presentation/main/main_screen.dart';
import '../../../presentation/splash/splash.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final NavigatorState navigatorState = navigatorKey.currentState!;

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound).tr(),
              ),
              body: Center(child: const Text(AppStrings.noRouteFound).tr()),
            ));
  }
}
