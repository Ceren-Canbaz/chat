import 'package:chat/core/themes/light_theme.dart';
import 'package:chat/features/auth/presentation/pages/auth_page.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/services/injectable.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
      home: const AuthPage(),
    );
  }
}
