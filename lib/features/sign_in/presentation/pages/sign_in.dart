import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:cooks_corner/config/constants/strings.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:cooks_corner/config/routes/app_routes.dart';
import 'package:cooks_corner/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/orange_text_style.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/text_field_style.dart';
import 'package:cooks_corner/features/sign_up/presentation/widgets/navigation_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late bool _passwordVisible;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _passwordVisibility() {
    setState(
      () {
        _passwordVisible = !_passwordVisible;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInDone) {
            Navigator.pushNamed(context, AppRoutes.bottomNav);
          } else if (state is SignInError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Вход не выполнен',
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final signInBloc = BlocProvider.of<SignInBloc>(context);
          final isFormValid = state is ValidationState && state.isFormValid;
          final isEmailValid =
              state is ValidationState ? state.isEmailValid : true;
          final isPasswordValid =
              state is ValidationState ? state.isPasswordValid : true;
          return Column(
            children: [
              OrangeBoxStyle(
                height: MediaQuery.of(context).size.height / 3.5,
                thinText: AppStrings.welcomeBack,
                boldText: AppStrings.cooksCorner,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.d20)
                    .copyWith(top: Dimens.d36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHelperText(AppStrings.gmail),
                    const SizedBox(height: Dimens.d4),
                    TextFieldStyle(
                      onChanged: (email) => signInBloc.add(
                        EmailChanged(email),
                      ),
                      errorText: !isEmailValid ? 'Неверный email' : null,
                      hint: AppStrings.enterGmail,
                      icon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.alternate_email_rounded,
                          color: AppColors.iconFaded,
                        ),
                      ),
                    ),
                    const SizedBox(height: Dimens.d16),
                    _buildHelperText(AppStrings.password),
                    const SizedBox(height: Dimens.d4),
                    TextFieldStyle(
                      onChanged: (password) => signInBloc.add(
                        PasswordChanged(password),
                      ),
                      errorText: !isPasswordValid ? 'Неверный пароль' : null,
                      obscureText: !_passwordVisible,
                      icon: IconButton(
                        onPressed: _passwordVisibility,
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.iconFaded,
                        ),
                      ),
                      hint: AppStrings.enterPassword,
                    ),
                    const SizedBox(height: Dimens.d24),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: isFormValid
                            ? () {
                                signInBloc.add(SignInSubmitted());
                              }
                            : null,
                        child: Text(
                          AppStrings.signIn,
                          style: Styles.s14w400.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              NavigationText(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, AppRoutes.signUp);
                  },
              ),
              const SizedBox(height: Dimens.d64),
            ],
          );
        },
      ),
    );
  }

  Text _buildHelperText(String text) {
    return Text(text, style: Styles.s16w500);
  }
}
