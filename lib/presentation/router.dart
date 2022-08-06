import 'package:feliz_sabado/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

const String kRouteHomePage = '/';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        switch (settings.name) {
          case kRouteHomePage:
            return const HomePage();
          default:
            return const HomePage();
        }
      },
      settings: settings,
    );
  }
}
