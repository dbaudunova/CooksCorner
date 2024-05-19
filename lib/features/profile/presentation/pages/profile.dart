import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:cooks_corner/config/constants/strings.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:cooks_corner/features/profile/presentation/widgets/elevated_button_style.dart';
import 'package:cooks_corner/features/profile/presentation/widgets/exit_alert_dialog.dart';
import 'package:cooks_corner/features/profile/presentation/widgets/follow_column_style.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.d20)
              .copyWith(top: Dimens.d28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Dimens.d88,
                    height: Dimens.d88,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const FollowColumnStyle(
                    countText: '29',
                    followText: AppStrings.recipe,
                  ),
                  const FollowColumnStyle(
                    countText: '144',
                    followText: AppStrings.followers,
                  ),
                  const FollowColumnStyle(
                    countText: '100',
                    followText: AppStrings.following,
                  ),
                ],
              ),
              const SizedBox(height: Dimens.d12),
              Text(
                'Sarthak Ranjan Hota',
                style: Styles.s16w500.copyWith(
                  color: AppColors.text,
                  fontFamily: 'PoppinsMedium',
                ),
              ),
              const SizedBox(height: Dimens.d4),
              Text(
                'Im a passionate chef who loves creating delicious dishes with flair.',
                style: Styles.s12w500.copyWith(color: AppColors.textFaded),
              ),
              const SizedBox(height: Dimens.d12),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButtonStyle(
                  text: AppStrings.manageProfile,
                  textStyle: Styles.s14w400.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: AppColors.secondary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
            onPressed: () {
              _showDialog();
            },
            icon: Icon(
              Icons.logout,
              color: AppColors.iconFaded,
            ),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(left: Dimens.d20),
        child: Text(
          AppStrings.profile,
          style: Styles.s20w500,
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return ExitAlertDialogStyle(
          title: AppStrings.wannaLeave,
          onYesPressed: () {},
          onNoPressed: () {},
        );
      },
    );
  }
}
