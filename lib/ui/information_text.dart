import 'package:flutter/material.dart';

class InformationText extends StatelessWidget {
  final String title;
  final String subTitle;

  const InformationText(
      {super.key, required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          TextSpan(
            text: subTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
