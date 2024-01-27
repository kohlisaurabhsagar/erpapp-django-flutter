import 'package:flutter/material.dart';
import 'package:flutter_frontend/custom_routes/constant.dart';
import 'package:flutter_frontend/app_screens/dr_sample2.dart';
import 'package:flutter_frontend/app_screens/dr_sample1.dart';
import 'package:flutter_frontend/app_screens/dr_call_page3.dart';
import 'package:flutter_frontend/app_screens/dr_call_page2.dart';
import 'package:flutter_frontend/app_screens/dr_call_page1.dart';
import 'package:flutter_frontend/app_screens/login_page.dart';
import 'package:flutter_frontend/app_screens/landing_page.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case landingRoute:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case drSample1Route:
        // var data = settings.arguments as String;
        // return MaterialPageRoute(builder: (_) => Details(data));
        return MaterialPageRoute(builder: (_) => const DrSample1());
      case drSample2Route:
        return MaterialPageRoute(builder: (_) => const DrSample2());
      case drCall1Route:
        return MaterialPageRoute(builder: (_) => const DrCall());
      case drCall2Route:
        return MaterialPageRoute(builder: (_) => const DrCall2());
      case drCall3Route:
        return MaterialPageRoute(builder: (_) => const DrCall3());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
