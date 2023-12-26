import 'package:flutter/material.dart';
import 'package:flutter_frontend/app_screens/dr_sample2.dart';
import 'package:flutter_frontend/app_screens/dr_sample1.dart';
import 'package:flutter_frontend/app_screens/dr_call_page3.dart';
import 'package:flutter_frontend/app_screens/dr_call_page2.dart';
import 'package:flutter_frontend/app_screens/dr_call_page1.dart';
import 'package:flutter_frontend/app_screens/login_page.dart';
import 'package:flutter_frontend/app_screens/landing_page.dart';
import 'package:flutter_frontend/app_screens/splash_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const SplashScreen(),
    routes: {
      'login_page': (context) => const LoginPage(),
      'landing_page': (context) => const LandingPage(),
      'dr_call_page1': (context) => const DrCall(),
      'dr_call_page2': (context) => const DrCall2(),
      'dr_call_page3': (context) => const DrCall3(),
      'dr_sample1.dart': (context) => const DrSample1(),
      'dr_sample2.dart': (context) => const DrSample2(),
    },
  ));
}
