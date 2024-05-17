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

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const OrangeBoxStyle(
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
                  icon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_outlined,
                      color: AppColors.iconFaded,
                    ),
                  ),
                  hint: AppStrings.enterPassword,
                ),
                const SizedBox(height: Dimens.d24),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
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
      ),
    );
  }

  Text _buildHelperText(String text) {
    return Text(text, style: Styles.s16w500);
  }
}
