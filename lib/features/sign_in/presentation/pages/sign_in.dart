import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/dimens.dart';
import 'package:cooks_corner/core/constants/strings.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:cooks_corner/core/routes/app_routes.dart';
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
  final _formKey = GlobalKey<FormState>();

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
          if (state is SignInError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.red,
                content: Text('${state.error}'),
              ),
            );
          } else if (state is SignInLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SignInDone) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Authorization completed successfully',
                ),
              ),
            );
            Navigator.pushNamed(context, AppRoutes.bottomNav);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              OrangeBoxStyle(
                thinText: AppStrings.welcomeBack,
                boldText: AppStrings.cooksCorner,
                height: MediaQuery.of(context).size.height / 3.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.d20)
                    .copyWith(top: Dimens.d36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHelperText(AppStrings.gmail),
                    const SizedBox(height: Dimens.d4),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldStyle(
                            controller: _emailController,
                            validator: (value) {
                              return _validateEmail(value);
                            },
                            hint: AppStrings.enterGmail,
                            icon: Icon(
                              Icons.alternate_email_rounded,
                              color: AppColors.iconFaded,
                            ),
                          ),
                          const SizedBox(height: Dimens.d16),
                          _buildHelperText(AppStrings.password),
                          const SizedBox(height: Dimens.d4),
                          TextFieldStyle(
                            controller: _passwordController,
                            validator: (value) {
                              return _validatePassword(value);
                            },
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
                        ],
                      ),
                    ),
                    const SizedBox(height: Dimens.d24),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignInBloc>().add(
                                  MakeAuth(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        },
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

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password has t0 be at least 8 characters long';
    }
    return null;
  }
}
