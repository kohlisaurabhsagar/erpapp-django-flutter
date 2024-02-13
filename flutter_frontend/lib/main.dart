import 'package:flutter/material.dart';
import 'package:flutter_frontend/custom_routes/routes.dart';
import 'package:flutter_frontend/app_screens/splash_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
        SplashScreen(), //defining the splash screen of the app as the homescreen
    onGenerateRoute: Routers.generateRoute,
  ));
}
