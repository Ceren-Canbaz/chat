import 'package:chat/core/constants/enums/auth_enum.dart';
import 'package:chat/core/widgets/custom_button.dart';
import 'package:chat/core/widgets/custom_text_field.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordVerifyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/svgs/chat.svg",
                color: Theme.of(context).colorScheme.primary,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Create Account",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            CustomTextField(
              controller: _emailController,
              hintText: "Email",
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              controller: _passwordVerifyController,
              hintText: "Verify Password",
              obscureText: true,
            ),
            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              if ((state).message != "") {
                return Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(state.message),
                );
              } else {
                return Container();
              }
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Button(
                  text: "Register",
                  onPressed: () async {
                    await context.read<AuthCubit>().register(
                        _emailController.text,
                        _passwordController.text,
                        _passwordVerifyController.text);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do you have an account already? ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<AuthCubit>().changePage(
                          pageState: AuthPageState.login,
                        );
                  },
                  child: Text(
                    "Login!",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
