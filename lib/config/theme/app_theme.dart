import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(
        inputDecorationTheme: _inputDecoration,
        elevatedButtonTheme: _elevatedButton);
  }

  static InputDecorationTheme get _inputDecoration => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.d40),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.inputFieldBackground,
        hintStyle: Styles.s14w400,
        contentPadding: const EdgeInsets.symmetric(
          vertical: Dimens.d12,
          horizontal: Dimens.d20,
        ),
      );

  static ElevatedButtonThemeData get _elevatedButton => ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.d40),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: Dimens.d12),
          ),
        ),
      );
}
