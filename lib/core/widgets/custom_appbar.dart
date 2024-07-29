import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar {
  static AppBar appBar({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      shadowColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Theme.of(context).colorScheme.background,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
