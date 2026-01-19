import 'package:flutter/material.dart';
import 'package:weather_app/utils/color/app_colors.dart';
import 'package:weather_app/utils/config/app_config.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkBackground,
  fontFamily: AppConfig.fontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.darkPrimary),
    titleTextStyle: TextStyle(
      color: AppColors.darkText,
      fontFamily: AppConfig.fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkPrimary,
      foregroundColor: AppColors.brandHoverColor,
      minimumSize: const Size(186, 48),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(
        fontFamily: AppConfig.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.darkPrimary, width: 1.5),
      foregroundColor: AppColors.darkPrimary,
      minimumSize: const Size(186, 48),
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(
        fontFamily: AppConfig.fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.darkPrimary,
      textStyle: const TextStyle(
        fontFamily: AppConfig.fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.darkPrimary),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkSurface,
    iconColor: AppColors.darkPrimary,
    prefixIconColor: AppColors.darkPrimary,
    suffixIconColor: AppColors.darkPrimary,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 2, color: AppColors.errorColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryText, width: 1.5),
    ),
    hintStyle: const TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.darkSecondaryText,
    ),
    errorStyle: const TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.errorColor,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),
    headlineSmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),
    titleLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),
    titleMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),
    titleSmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.darkSecondaryText,
    ),
    bodyMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.darkSecondaryText,
    ),
    bodySmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.darkSecondaryText,
    ),
    labelLarge: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),
    labelMedium: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),
    labelSmall: TextStyle(
      fontFamily: AppConfig.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.darkText,
    ),
  ),
);
