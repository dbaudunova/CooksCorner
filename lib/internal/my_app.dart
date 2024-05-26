import 'package:cooks_corner/core/routes/app_routes.dart';
import 'package:cooks_corner/core/theme/app_theme.dart';
import 'package:cooks_corner/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cooks_corner/features/sign_up/data/remote/data_source/sign_up_data_source.dart';
import 'package:cooks_corner/features/sign_up/data/repository/sign_up_repository_impl.dart';
import 'package:cooks_corner/features/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:cooks_corner/features/sign_up/presentation/bloc/sign_up_bloc.dart';
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
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(
            SignUpUseCase(
              SignUpRepositoryImpl(
                SignUpDataSourceImpl(),
              ),
            ),
          ),
        ),
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
