import 'package:chat/core/widgets/custom_appbar.dart';
import 'package:chat/core/widgets/filled_text_field.dart';
import 'package:chat/ui/app_drawer.dart';
import 'package:chat/ui/information_text.dart';
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
      appBar: CustomAppBar.appBar(
        context: context,
        title: "Settings",
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///add image
            const InformationText(title: "Username", subTitle: "Ceren Canbaz"),
            const InformationText(
                title: "Email", subTitle: "ceren_canbaz@hotmail.com"),
            // FilledTextField(
            //   hint: "Username",
            //   controller: TextEditingController(),
            // )
          ],
        ),
      ),
    );
  }
}
