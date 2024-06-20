
import 'package:flutter/material.dart';
import 'package:vital/core/presentation/app_colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: AppColors.purplePlum,
    disabledColor: AppColors.dustGrey,
    splashColor: AppColors.violetLight,
    scaffoldBackgroundColor: AppColors.white,
    cardTheme: const CardTheme(
        color: Colors.white,
        shadowColor:AppColors.dustGrey,
        elevation: 4),

    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: AppColors.dustGrey,
        buttonColor: AppColors.purplePlum,
        splashColor: AppColors.lightGrey),
  );
}