import 'package:chat/core/widgets/custom_button.dart';
import 'package:chat/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
              textController: _emailController,
              hintText: "Email",
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              textController: _passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
            Button(
              text: "Login",
              onPressed: () {
                ///call login method
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an account? ",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "Register!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
