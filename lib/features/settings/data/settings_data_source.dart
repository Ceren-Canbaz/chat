import 'dart:ffi';
import 'dart:io';

import 'package:chat/core/handlers/request_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
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
  final _storageRef = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RequestHandler _requestHandler = RequestHandler();

  @override
  Future<void> uploadProfileImage({
    required String userId,
    required XFile imageFile,
  }) async {
    return await _requestHandler.call(() async {
      final file = File(imageFile.path);

      if (!await file.exists()) {
        print('Dosya mevcut değil: ${file.path}');
        return;
      }

      final fileRef = _storageRef.ref().child('profile_images').child(userId);

      final uploadTask = fileRef.putFile(file);

      final snapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await snapshot.ref.getDownloadURL();

      await _firestore.collection('Users').doc(userId).update({
        'imageFolder': downloadUrl,
      });
    });
  }
}
