import 'package:cooks_corner/config/routes/app_routes.dart';
import 'package:cooks_corner/config/theme/app_theme.dart';
import 'package:cooks_corner/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignInBloc()),
      ],
      child: MaterialApp(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.signIn,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
