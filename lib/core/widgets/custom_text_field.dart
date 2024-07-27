import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText = "",
    this.readOnly = false,
    this.onSubmit,
    this.onChange,
  });
  final String hintText;
  final bool readOnly;
  final Function(String value)? onSubmit;
  final Function(String value)? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onSubmitted: (value) {
        if (widget.onSubmit != null) {
          widget.onSubmit!(value);
        }
      },
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
    );
  }
}
