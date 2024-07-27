import 'package:chat/core/themes/dark_theme.dart';
import 'package:chat/core/themes/light_theme.dart';
import 'package:chat/features/auth/presentation/features/auth/presentation/pages/auth_page.dart';
import 'package:chat/features/auth/presentation/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: AuthPage(),
    );
  }
}
