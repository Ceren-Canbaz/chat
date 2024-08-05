import 'dart:io';

import 'package:chat/core/handlers/request_handler.dart';
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

  final RequestHandler _requestHandler = RequestHandler();

  @override
  Future<void> uploadProfileImage({
    required String userId,
    required XFile imageFile,
  }) async {
    // try {
    //   // Firebase Storage'da bir referans oluştur
    //   final imagesRef = _storageRef
    //       .child('profile_images/$userId/${DateTime.now().toIso8601String()}');

    //   // Dosyayı yükle
    //   final uploadTask = imagesRef.putFile(File(imageFile.path));
    //   await uploadTask.whenComplete(() => print('Upload complete'));

    //   // Yükleme tamamlandıktan sonra download URL'yi al
    //   final downloadUrl = await imagesRef.getDownloadURL();
    //   print('Download URL obtained: $downloadUrl');

    //   // Realtime Database'de URL'yi güncelle
    //   final userRef = _fireStore.ref('Users/$userId');
    //   await userRef.update({
    //     'imageFolder': downloadUrl,
    //   });

    //   print(
    //       'Realtime Database document updated successfully with URL: $downloadUrl');
    // } catch (e) {
    //   print('Error occurred during upload and update: $e');
    // }
  }
}
