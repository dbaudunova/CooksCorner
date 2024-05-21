import 'package:cooks_corner/core/constants/assets.dart';
import 'package:cooks_corner/core/constants/dimens.dart';
import 'package:cooks_corner/core/constants/strings.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:cooks_corner/core/routes/app_routes.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.d20)
              .copyWith(top: Dimens.d14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                AppStrings.whatEat,
                style: Styles.s20w500,
              ),
              const SizedBox(height: Dimens.d24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${AppStrings.recipe}s',
                  style: Styles.s18w500.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: Dimens.d32),
              const TextFieldStyle(
                hint: AppStrings.searchRecipes,
                icon: Icon(Icons.search),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.createRecipe);
                  },
                  icon: SvgPicture.asset(Assets.addCircle),
                  label: Text(
                    AppStrings.addRecipe,
                    style: Styles.s14w400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Dimens.d24),
            ],
          ),
        ),
      ),
    );
  }
}
