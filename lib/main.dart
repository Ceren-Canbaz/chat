import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/auth/presentation/pages/auth_gate.dart';
import 'package:chat/features/auth/presentation/pages/auth_page.dart';
import 'package:chat/features/chat/presentation/chat_page.dart';
import 'package:chat/features/home/presentation/home_page.dart';
import 'package:chat/features/settings/presentation/settings_page.dart';
import 'package:chat/firebase_options.dart';
import 'package:chat/services/injectable/injectable.dart';
import 'package:chat/services/theme_provider/cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, themeData) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeData,
          home: const AuthGate(),
          routes: {
            '/auth': (context) => const AuthPage(),
            '/home': (context) => const HomePage(),
            '/settings': (context) => SettingsPage(
                user:
                    ModalRoute.of(context)!.settings.arguments as UserApiModel),
            '/chat': (context) => ChatPage(
                user:
                    ModalRoute.of(context)!.settings.arguments as UserApiModel),
          },
        );
      },
    );
  }
}
