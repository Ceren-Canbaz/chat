import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar appBar({
    required BuildContext context,
    required String title,
    Widget? child,
    VoidCallback? onTap,
  }) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      titleSpacing: -8,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
      ),
      title: Row(
        children: [
          if (child != null)
            Padding(
              padding: const EdgeInsets.only(
                right: 18,
              ),
              child: child,
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
