import 'package:chat/core/colors/app_colors.dart';
import 'package:chat/core/themes/input_decoration_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    background: AppColors.background,
    surface: AppColors.surface,
    error: AppColors.error,
    onPrimary: AppColors.onPrimary,
    onSecondary: AppColors.onSecondary,
    onBackground: AppColors.onBackground,
    onSurface: AppColors.onSurface,
    onError: AppColors.onError,
  ),
  inputDecorationTheme: inputdDcorationTheme,
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
  ),
);
