import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooks_corner/core/constants/assets.dart';
import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/dimens.dart';
import 'package:cooks_corner/core/constants/strings.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:cooks_corner/features/description/presentation/widgets/ingredients_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeDescription extends StatefulWidget {
  const RecipeDescription({super.key});

  @override
  State<RecipeDescription> createState() => _RecipeDescriptionState();
}

class _RecipeDescriptionState extends State<RecipeDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    'https://s3-alpha-sig.figma.com/img/60a8/fb40/0136c54edf4e723f8270242c7c79b16c?Expires=1717372800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PFR7stsJuQ9oyDzgw7HkR59r7jyrVU95Haau8eGOZ1g7T2no2QIpiXHLq4VNaNPC1Oh5KwYIggWHjE2HjmCvGtdHHyZaJLOOxT71KIOpfPv7gEPQh-cCYjLWtuJhrhHf6HAoEfqzVo0OOl7GXcUuwWACLxcsAYiZIzDh9Z1I9roSTGxXSXiV3iGS8T9C9bCrIvKJ371MZR9dRQYgHQmV0Awcst~yRtGB41GLboxB4v9xQhirCXDiRH2dcbh9fSWU1iG5ssTpJLcqBLbJRUxibBnoYJH3JRRAJ-i7Csw3Na8ejSgcPy8JUar7NuEvlEqkFld6XtexHOCxaBRQwwAAIg__',
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.d20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.d20)
                      .copyWith(top: Dimens.d20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ainsley’s Jerk Chicken',
                          style: Styles.s20w500,
                        ),
                        const SizedBox(height: Dimens.d12),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.clock),
                            const SizedBox(width: Dimens.d8),
                            Text(
                              '20-30 min',
                              style: Styles.s14w400.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Dimens.d8),
                        _buildComplexity(),
                        const SizedBox(height: Dimens.d16),
                        Text(
                          'by Ainsley Harriott',
                          style: Styles.s12w500.copyWith(
                            color: AppColors.textFaded,
                          ),
                        ),
                        const SizedBox(height: Dimens.d16),
                        _buildLikesRow(),
                        const SizedBox(height: Dimens.d24),
                        Text(
                          AppStrings.description,
                          style: Styles.s16w500.copyWith(
                            color: AppColors.text,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: Dimens.d8),
                        Text(
                          'You pick up your palette knife and then work that into. Give your meat a good old rub. That’s it, nice and hot, hot and spicy meat. He-he boy...',
                          style: Styles.s14w400.copyWith(
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(height: Dimens.d20),
                        Text(
                          AppStrings.ingredients,
                          style: Styles.s16w500.copyWith(
                            color: AppColors.text,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: Dimens.d24),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const IngredientsItem();
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: AppColors.inputFieldBackground,
                            );
                          },
                          itemCount: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _buildLikesRow() {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.heart,
          colorFilter: ColorFilter.mode(
            AppColors.text,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: Dimens.d8),
        Text(
          '12 likes',
          style: Styles.s12w500,
        ),
        const Spacer(),
        SvgPicture.asset(
          Assets.bookmark,
          colorFilter: ColorFilter.mode(
            AppColors.text,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }

  Container _buildComplexity() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.d8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        AppStrings.easy,
        style: Styles.s12w500,
      ),
    );
  }
}
