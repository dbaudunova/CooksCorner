import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:flutter/material.dart';

class TextFieldStyle extends StatelessWidget {
  const TextFieldStyle({
    super.key,
    required this.hint,
    required this.icon,
  });

  final String hint;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.text,
      style: Styles.s14w400.copyWith(color: AppColors.text),
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hint,
      ),
    );
  }
}