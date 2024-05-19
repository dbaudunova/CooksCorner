import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:cooks_corner/config/constants/strings.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:cooks_corner/features/profile/presentation/widgets/elevated_button_style.dart';
import 'package:flutter/material.dart';

class ExitAlertDialogStyle extends StatelessWidget {
  const ExitAlertDialogStyle({
    super.key,
    required this.title,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  final String title;
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        textAlign: TextAlign.center,
        title,
        style: Styles.s20w500,
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButtonStyle(
                  onPressed: onYesPressed,
                  text: AppStrings.yes,
                  textStyle: Styles.s14w400.copyWith(
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: AppColors.secondary,
                ),
              ),
              const SizedBox(width: Dimens.d20),
              Expanded(
                child: ElevatedButtonStyle(
                  textStyle: Styles.s14w400.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: onNoPressed,
                  text: AppStrings.no,
                  backgroundColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
