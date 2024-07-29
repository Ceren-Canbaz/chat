import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:svg_flutter/svg.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Navigate to the home page if user is authenticated
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home');
          });
          return const Scaffold(
            body: SplashLogo(),
          );
        } else {
          // Navigate to the login page if user is not authenticated
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/auth');
          });
          return const Scaffold(
            body: SplashLogo(),
          );
        }
      },
    );
  }
}

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        "assets/svgs/chat.svg",
        color: Theme.of(context).colorScheme.primary,
        height: 102,
        alignment: Alignment.center,
      ),
    );
  }
}
