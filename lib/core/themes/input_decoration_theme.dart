import 'package:chat/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

const inputdDcorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.surface,
  border: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.secondary),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.error),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  labelStyle: TextStyle(color: AppColors.onBackground),
  hintStyle: TextStyle(
    color: AppColors.onBackground,
  ),
);
