import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooks_corner/core/constants/assets.dart';
import 'package:cooks_corner/core/constants/dimens.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.d16),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            'https://s3-alpha-sig.figma.com/img/f2b2/a0f4/bca297ef579e6efc869bdd2d06414c28?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OKWBY77Ua2aT7xznTbTPTtSdVR4I0-ZXXK6wrCkO4DzAibm9fiWFhDYkA0-YiAcxEFAivW55Ts2cLyQ5-71tXTWbT9w4RxjFyuxXc8FYqrKYw6407505baVqsmlFY5KCIJ7tnKw8N3J4CP~xebCkt8rq7Ui0qrDgXyhrmEH2GB1ZGP~uikuHH9m6ewdXMCoY6pLqe64kFyYcju6ShgSW1lUF4w05bmizAKG7Xv7AnPeoFj2kkdd~7dTC7GR3E7~Cls-m--UQauajfhWO4h3fHjtNz-plVY8nirvKDL~K6KtfhjAH0x07bCcwRI90LVmr7YJXg8LhhDY5fzyz1xLVNw__',
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.d12,
          vertical: Dimens.d12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Egg Omlet',
              style: Styles.s16w500.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'by Ainsley Harriott',
              style: Styles.s16w500.copyWith(
                color: Colors.white,
                fontSize: Dimens.d12,
              ),
            ),
            const SizedBox(height: Dimens.d8),
            Row(
              children: [
                SvgPicture.asset(Assets.heart),
                const SizedBox(width: Dimens.d4),
                Text(
                  '118',
                  style: Styles.s12w500.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(Assets.bookmark),
                const SizedBox(width: 4),
                Text(
                  '118',
                  style: Styles.s12w500.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
