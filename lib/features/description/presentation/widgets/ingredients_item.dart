import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:flutter/material.dart';

class IngredientsItem extends StatelessWidget {
  const IngredientsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Chicken',
          style: Styles.s14w400.copyWith(
            color: AppColors.text,
          ),
        ),
        const Spacer(),
        Text(
          '1kg',
          style: Styles.s14w400,
        ),
      ],
    );
  }
}
