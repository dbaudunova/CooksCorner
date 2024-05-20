import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/strings.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  const NavigationText({
    super.key,
    required this.recognizer,
  });

  final TapGestureRecognizer recognizer;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppStrings.noAccount,
        style: Styles.s12w500,
        children: [
          TextSpan(
            text: AppStrings.signUpNow,
            style: Styles.s12w500.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: recognizer,
          ),
        ],
      ),
    );
  }
}
