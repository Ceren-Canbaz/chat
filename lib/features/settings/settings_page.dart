import 'package:chat/ui/app_drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        onTapHome: () {
          Navigator.of(context).pushReplacementNamed(
            "/home",
          );
        },
        onTapSettings: () {
          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        title: Text("Settings"),
      ),
    );
  }
}
