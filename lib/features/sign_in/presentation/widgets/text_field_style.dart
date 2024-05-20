import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:flutter/material.dart';

class TextFieldStyle extends StatelessWidget {
  const TextFieldStyle({
    super.key,
    required this.hint,
    required this.icon,
    this.obscureText,
    this.onChanged,
    this.errorText,
  });

  final String hint;
  final Widget icon;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      cursorColor: AppColors.text,
      style: Styles.s14w400.copyWith(color: AppColors.text),
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: icon,
        hintText: hint,
      ),
    );
  }
}
