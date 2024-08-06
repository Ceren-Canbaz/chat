import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key, this.title, this.message});
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: SizedBox(
            height: 72,
            width: 27,
            child: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
