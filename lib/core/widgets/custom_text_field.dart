import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText = "",
    this.readOnly = false,
    this.obscureText = false,
    this.onSubmit,
    this.onChange,
  });
  final String hintText;
  final bool readOnly;
  final bool obscureText;
  final Function(String value)? onSubmit;
  final Function(String value)? onChange;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: (value) {
        if (onSubmit != null) {
          onSubmit!(value);
        }
      },
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
