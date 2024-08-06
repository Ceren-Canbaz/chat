import 'package:chat/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

const inputdDcorationThemeLight = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.surface,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.surface),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.surface),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  labelStyle: TextStyle(color: AppColors.onBackground),
  hintStyle: TextStyle(
    color: AppColors.primary,
  ),
);

const inputdDcorationThemeDark = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.darkSurface,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.darkPrimary),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.darkSurface),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.darkSurface),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.darkError),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.darkError),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
  labelStyle: TextStyle(color: AppColors.darkOnBackground),
  hintStyle: TextStyle(
    color: AppColors.darkPrimary,
  ),
);
