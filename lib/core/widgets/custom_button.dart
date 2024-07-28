import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          color: onPressed != null
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 54,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: onPressed != null
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.2),
                ),
          ),
        ),
      ),
    );
  }
}
