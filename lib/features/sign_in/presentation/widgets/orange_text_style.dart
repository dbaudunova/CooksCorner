import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/dimens.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:flutter/material.dart';

class OrangeBoxStyle extends StatelessWidget {
  const OrangeBoxStyle({
    super.key,
    required this.thinText,
    required this.boldText,
    required this.height,
  });

  final String thinText;
  final String boldText;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: Dimens.d20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              thinText,
              style: Styles.s24w300,
            ),
            Text(
              boldText,
              style: Styles.s24w600,
            ),
          ],
        ),
      ),
    );
  }
}
