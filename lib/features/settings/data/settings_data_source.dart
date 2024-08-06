import 'dart:io';

import 'package:chat/core/handlers/request_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

abstract class SettingsDataSource {
  Future<void> uploadProfileImage({
    required String userId,
    required XFile imageFile,
  });
  Future<void> updateUsername({
    required String userId,
    required String username,
  });
  Future<bool> loadThemeFromLocal();
  Future<void> saveThemeToLocal(bool isDarkMode);
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

  @override
  Future<void> updateUsername(
      {required String userId, required String username}) async {
    return _requestHandler.call(
      () async {
        await _firestore.collection('Users').doc(userId).update(
          {
            'username': username,
          },
        );
      },
    );
  }

  @override
  Future<void> saveThemeToLocal(bool isDarkMode) async {
    try {
      final box = await Hive.openBox('settingsBox');

      await box.put('isDarkMode', isDarkMode);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool> loadThemeFromLocal() async {
    final box = await Hive.openBox('settingsBox');
    return box.get('isDarkMode', defaultValue: false);
  }
}
