import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              "assets/svgs/chat.svg",
              color: Theme.of(context).colorScheme.primary,
              alignment: Alignment.center,
            ),
          ),
          TextField()
        ],
      ),
    );
  }
}
