import 'package:chat/core/widgets/custom_appbar.dart';
import 'package:chat/ui/app_drawer.dart';
import 'package:chat/ui/information_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        onTapHome: () {
          Navigator.of(context).pushReplacementNamed("/home");
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
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async {
                  await _requestPermissions();
                  await _pickImage(ImageSource.gallery);
                },
                child: Icon(
                  Icons.person,
                  size: 68,
                ),
              ),
            ),
            const InformationText(title: "Username", subTitle: "Ceren Canbaz"),
            const InformationText(
                title: "Email", subTitle: "ceren_canbaz@hotmail.com"),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        print('Image path: ${pickedFile.path}');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      print("Permission granted");
    } else if (status.isDenied) {
      print("Permission denied");
    } else if (status.isPermanentlyDenied) {
      print("Permission permanently denied");
    }
  }
}
