import 'package:chat/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimary,
    secondary: AppColors.darkSecondary,
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    error: AppColors.darkError,
    onPrimary: AppColors.darkOnPrimary,
    onSecondary: AppColors.darkOnSecondary,
    onBackground: AppColors.darkOnBackground,
    onSurface: AppColors.darkOnSurface,
    onError: AppColors.darkOnError,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.darkPrimary,
    textTheme: ButtonTextTheme.primary,
  ),
);
