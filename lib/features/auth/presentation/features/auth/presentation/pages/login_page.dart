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
            Button(
              text: "Login",
              onPressed: () {
                ///call login method
              },
            ),
          ],
        ),
      ),
    );
  }
}
