import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class SettingsDataSource {
  Future<void> uploadProfileImage({
    required String userId,
    required XFile imageFile,
  });
}

@LazySingleton(as: SettingsDataSource)
class SettingsDataSourceImpl implements SettingsDataSource {
  final _storageRef = FirebaseStorage.instance.ref();
  final _fireStore = FirebaseFirestore.instance;
  @override
  Future<void> uploadProfileImage({
    required String userId,
    required XFile imageFile,
  }) async {
    // Create a reference to Firebase Storage

    final imagesRef = _storageRef
        .child('profile_images/$userId/${DateTime.now().toIso8601String()}');

    // Upload the file
    await imagesRef.putFile(File(imageFile.path));

    // Get the download URL
    final downloadUrl = await imagesRef.getDownloadURL();

    // Save the URL to Firestore or Realtime Database
    await _fireStore.collection('users').doc(userId).update({
      'imageFolder': downloadUrl,
    });
  }
}
