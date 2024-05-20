import 'package:cooks_corner/core/constants/styles.dart';
import 'package:flutter/material.dart';

class FollowColumnStyle extends StatelessWidget {
  const FollowColumnStyle({
    super.key,
    required this.countText,
    required this.followText,
  });

  final String countText;
  final String followText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          countText,
          style: Styles.s20w500,
        ),
        Text(
          followText,
          style: Styles.s14w400,
        ),
      ],
    );
  }
}
