import 'package:cooks_corner/config/constants/colors.dart';
import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static TextStyle s24w300 = const TextStyle(
    fontWeight: FontWeight.w300,
    fontFamily: 'PoppinsLight',
    color: Colors.white,
    fontSize: Dimens.d24,
  );

  static TextStyle s24w600 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'PoppinsLight',
    color: Colors.white,
    fontSize: Dimens.d24,
  );

  static TextStyle s16w500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'PoppinsRegular',
    color: AppColors.primary,
    fontSize: Dimens.d16,
  );

  static TextStyle s14w400 = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'PoppinsRegular',
    color: AppColors.textFaded,
    fontSize: Dimens.d16,
  );

  static TextStyle s12w500 = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'PoppinsLight',
    color: AppColors.text,
    fontSize: Dimens.d12,
  );
}
