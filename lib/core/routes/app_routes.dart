import 'package:cooks_corner/features/create_recipe/presentation/pages/create_recipe.dart';
import 'package:cooks_corner/features/description/presentation/pages/description.dart';
import 'package:cooks_corner/features/home/presentation/navigation/bottom_nav.dart';
import 'package:cooks_corner/features/home/presentation/pages/home.dart';
import 'package:cooks_corner/features/profile/presentation/pages/profile.dart';
import 'package:cooks_corner/features/search/presentation/pages/search.dart';
import 'package:cooks_corner/features/sign_in/presentation/pages/sign_in.dart';
import 'package:cooks_corner/features/sign_up/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static const String signIn = '/sign_in';
  static const String signUp = '/sign_up';
  static const String home = '/home';
  static const String bottomNav = '/bottom_nav';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String createRecipe = '/create_recipe';
  static const String description = '/description';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      signIn: (context) => const SignIn(),
      signUp: (context) => const SignUp(),
      home: (context) => const Home(),
      bottomNav: (context) => const BottomNav(),
      profile: (context) => const Profile(),
      search: (context) => const Search(),
      createRecipe: (context) => const CreateRecipe(),
      description: (context) => const RecipeDescription(),
    };
  }
}