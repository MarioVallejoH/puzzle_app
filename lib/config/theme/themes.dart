import 'package:flutter/material.dart';
import 'package:natakapp/config/theme/colors.dart';

ThemeData get lightTheme {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
    buttonTheme: ButtonThemeData(),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
      foregroundColor: AppColors.kSecondaryColor,
      titleTextStyle: TextStyle(
        color: AppColors.kPrimaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
