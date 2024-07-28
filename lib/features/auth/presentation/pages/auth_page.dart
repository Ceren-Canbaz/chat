import 'package:chat/core/constants/enums/auth_enum.dart';
import 'package:chat/features/auth/data/auth_data_source.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat/features/auth/presentation/cubit/auth_state.dart';
import 'package:chat/features/auth/presentation/pages/login_page.dart';
import 'package:chat/features/auth/presentation/pages/register_page.dart';
import 'package:chat/services/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        authRepository: locator<AuthRepository>(),
      ),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.pageState == AuthPageState.login) {
            return LoginPage();
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
