import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/dimens.dart';
import 'package:cooks_corner/core/constants/strings.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:cooks_corner/core/routes/app_routes.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/orange_text_style.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/text_field_style.dart';
import 'package:cooks_corner/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:cooks_corner/features/sign_up/presentation/widgets/navigation_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late bool _passwordVisible;
  late bool _repeatPasswordVisible;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _repeatPasswordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: _buildListener,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                OrangeBoxStyle(
                  height: MediaQuery.of(context).size.height / 3.5,
                  thinText: AppStrings.signUpFor,
                  boldText: AppStrings.discoveries,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.d20)
                      .copyWith(top: Dimens.d36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHelperText(AppStrings.name),
                      const SizedBox(height: Dimens.d4),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldStyle(
                              validator: (value) {
                                return _validateName(value);
                              },
                              controller: _nameController,
                              hint: AppStrings.enterName,
                              icon: Icon(
                                Icons.person_outline_rounded,
                                color: AppColors.iconFaded,
                              ),
                            ),
                            const SizedBox(height: Dimens.d16),
                            _buildHelperText(AppStrings.gmail),
                            const SizedBox(height: Dimens.d4),
                            TextFieldStyle(
                              validator: (value) {
                                return _validateEmail(value);
                              },
                              controller: _emailController,
                              icon: Icon(
                                Icons.alternate_email_rounded,
                                color: AppColors.iconFaded,
                              ),
                              hint: AppStrings.enterGmail,
                            ),
                            const SizedBox(height: Dimens.d16),
                            _buildHelperText(AppStrings.password),
                            const SizedBox(height: Dimens.d4),
                            TextFieldStyle(
                              validator: (value) {
                                return _validatePassword(value);
                              },
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              icon: IconButton(
                                onPressed: () => setState(
                                  () => _passwordVisible = !_passwordVisible,
                                ),
                                icon: Icon(
                                  _buildIcon(_passwordVisible),
                                  color: AppColors.iconFaded,
                                ),
                              ),
                              hint: AppStrings.enterPassword,
                            ),
                            const SizedBox(height: Dimens.d16),
                            _buildHelperText(AppStrings.rePassword),
                            const SizedBox(height: Dimens.d4),
                            TextFieldStyle(
                              validator: (value) {
                                return _validatePassword(value);
                              },
                              controller: _repeatPasswordController,
                              obscureText: !_repeatPasswordVisible,
                              icon: IconButton(
                                onPressed: () => setState(
                                  () => _repeatPasswordVisible =
                                      !_repeatPasswordVisible,
                                ),
                                icon: Icon(
                                  _buildIcon(_repeatPasswordVisible),
                                  color: AppColors.iconFaded,
                                ),
                              ),
                              hint: AppStrings.reEnterPassword,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimens.d24),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: _buildSignUpButton(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.d24),
                NavigationText(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, AppRoutes.signIn);
                    },
                ),
                const SizedBox(height: Dimens.d64),
              ],
            ),
          );
        },
      ),
    );
  }

  ElevatedButton _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<SignUpBloc>().add(
                MakeRegister(
                  email: _emailController.text,
                  fullName: _nameController.text,
                  password: _passwordController.text,
                ),
              );
        }
      },
      child: Text(
        AppStrings.signUp,
        style: Styles.s14w400.copyWith(color: Colors.white),
      ),
    );
  }

  void _buildListener(context, state) {
    if (state is SignUpError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.red,
          content: Text('${state.error}'),
        ),
      );
    } else if (state is SignUpLoading) {
      const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SignUpDone) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Registration completed successfully',
          ),
        ),
      );
      Navigator.pushNamed(context, AppRoutes.signIn);
    }
  }

  IconData _buildIcon(bool password) {
    return password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }

  Text _buildHelperText(String text) {
    return Text(text, style: Styles.s16w500);
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    var password = _passwordController.text;
    var repeatPassword = _repeatPasswordController.text;
    if (value!.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password has to be at least 8 characters long';
    } else if (value != password || value != repeatPassword) {
      return 'Password mismatch';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }
}
