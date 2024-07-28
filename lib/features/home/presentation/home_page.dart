import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat/features/auth/presentation/cubit/auth_state.dart';
import 'package:chat/services/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
        ),
        actions: const [
          LogOut(),
        ],
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authRepository: locator<AuthRepository>()),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () async {
              await context.read<AuthCubit>().logOut();
            },
            icon: const Icon(
              Icons.login_outlined,
            ),
          );
        },
      ),
    );
  }
}
