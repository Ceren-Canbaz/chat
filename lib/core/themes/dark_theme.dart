import 'package:chat/core/colors/app_colors.dart';
import 'package:chat/core/themes/component_themes/button_theme.dart';
import 'package:chat/core/themes/component_themes/input_decoration_theme.dart';
import 'package:chat/core/themes/component_themes/text_theme.dart';
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
  textTheme: textTheme,
  inputDecorationTheme: inputdDcorationTheme,
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: elevatedButtonTheme,
);
