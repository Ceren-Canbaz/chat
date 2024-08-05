import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserApiModel extends Equatable {
  final String uid;
  final String email;
  final String imageFolder;

  const UserApiModel(
      {required this.uid, required this.email, required this.imageFolder});

  @override
  List<Object?> get props => [
        uid,
        email,
        imageFolder,
      ];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'imageFolder': imageFolder,
    };
  }

  UserApiModel copyWith({
    String? uid,
    String? email,
    String? imageFolder,
  }) {
    return UserApiModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        imageFolder: imageFolder ?? this.imageFolder);
  }

  factory UserApiModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserApiModel(
      uid: doc.id,
      email: data['email'] ?? '',
      imageFolder: data['imageFolder'] ?? '', // imageFolder buradan alınıyor
    );
  }
}
