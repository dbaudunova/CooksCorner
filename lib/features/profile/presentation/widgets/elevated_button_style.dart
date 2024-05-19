import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:flutter/material.dart';

class ElevatedButtonStyle extends StatelessWidget {
  const ElevatedButtonStyle({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
    required this.textStyle,
  });

  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
