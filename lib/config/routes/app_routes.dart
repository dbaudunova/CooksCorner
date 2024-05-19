import 'package:cooks_corner/features/home/presentation/navigation/bottom_nav.dart';
import 'package:cooks_corner/features/home/presentation/pages/home.dart';
import 'package:cooks_corner/features/sign_in/presentation/pages/sign_in.dart';
import 'package:cooks_corner/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String home = '/home';
  static const String bottomNav = '/bottom_nav';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      signIn: (context) => const SignIn(),
      signUp: (context) => const SignUp(),
      home: (context) => const Home(),
      bottomNav: (context) => const BottomNav(),
    };
  }
}