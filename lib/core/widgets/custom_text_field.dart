import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText = "",
    this.readOnly = false,
    this.obscureText = false,
    this.onSubmit,
    this.onChange,
    required this.textController,
  });
  final String hintText;
  final bool readOnly;
  final bool obscureText;
  final Function(String value)? onSubmit;
  final Function(String value)? onChange;
  final TextEditingController textController;
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
