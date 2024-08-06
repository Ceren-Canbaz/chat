import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle headline1 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headline2 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headline3 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle bodyText1 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle bodyText2 =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle caption =
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w300);
}

final textTheme = TextTheme(
  headlineLarge: AppTextStyles.headline1,
  headlineMedium: AppTextStyles.headline2,
  headlineSmall: AppTextStyles.headline3,
  bodyLarge: AppTextStyles.bodyText1,
  bodyMedium: AppTextStyles.bodyText2,
  bodySmall: AppTextStyles.caption,
);
