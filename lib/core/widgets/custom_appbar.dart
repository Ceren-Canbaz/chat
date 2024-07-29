import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar appBar({
    required BuildContext context,
    required String title,
    VoidCallback? onTap,
  }) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      leading: onTap != null
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}
