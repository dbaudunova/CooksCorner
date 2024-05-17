import 'package:cooks_corner/config/routes/app_routes.dart';
import 'package:cooks_corner/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signIn,
      routes: AppRoutes.getRoutes(),
    );
  }
}
