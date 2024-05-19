import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:cooks_corner/config/constants/strings.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:cooks_corner/config/routes/app_routes.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/orange_text_style.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/text_field_style.dart';
import 'package:cooks_corner/features/sign_up/presentation/widgets/navigation_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                  TextFieldStyle(
                    hint: AppStrings.enterName,
                    icon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_outline_rounded,
                        color: AppColors.iconFaded,
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimens.d16),
                  _buildHelperText(AppStrings.gmail),
                  const SizedBox(height: Dimens.d4),
                  TextFieldStyle(
                    icon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.alternate_email_rounded,
                        color: AppColors.iconFaded,
                      ),
                    ),
                    hint: AppStrings.enterGmail,
                  ),
                  const SizedBox(height: Dimens.d16),
                  _buildHelperText(AppStrings.password),
                  const SizedBox(height: Dimens.d4),
                  TextFieldStyle(
                    icon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.iconFaded,
                      ),
                    ),
                    hint: AppStrings.enterPassword,
                  ),
                  const SizedBox(height: Dimens.d16),
                  _buildHelperText(AppStrings.rePassword),
                  const SizedBox(height: Dimens.d4),
                  TextFieldStyle(
                    icon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.visibility_outlined,
                        color: AppColors.iconFaded,
                      ),
                    ),
                    hint: AppStrings.reEnterPassword,
                  ),
                  const SizedBox(height: Dimens.d24),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        AppStrings.signUp,
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
                  Navigator.pushNamed(context, AppRoutes.signIn);
                },
            ),
            const SizedBox(height: Dimens.d64),
          ],
        ),
      ),
    );
  }

  Text _buildHelperText(String text) {
    return Text(text, style: Styles.s16w500);
  }
}
