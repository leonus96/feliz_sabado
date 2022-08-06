import 'package:feliz_sabado/presentation/pages/home_page.dart';
import 'package:feliz_sabado/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:flutter/material.dart';

const String kRouteHomePage = '/';
const String kRouteOnBoarding = 'on_boarding';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    kRouteHomePage: (_) => const HomePage(),
    kRouteOnBoarding: (_) => const OnBoardingPage(),
  };
}
