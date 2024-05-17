import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:flutter/material.dart';

class OrangeBoxStyle extends StatelessWidget {
  const OrangeBoxStyle({
    super.key,
    required this.thinText,
    required this.boldText,
  });

  final String thinText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
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
