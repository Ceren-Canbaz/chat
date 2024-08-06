import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserApiModel extends Equatable {
  final String uid;
  final String email;
  final String imageFolder;
  final String username;

  const UserApiModel({
    required this.uid,
    required this.email,
    required this.imageFolder,
    required this.username,
  });

  @override
  List<Object?> get props => [uid, email, imageFolder, username];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'imageFolder': imageFolder,
      'username': username
    };
  }

  UserApiModel copyWith({
    String? uid,
    String? email,
    String? imageFolder,
    String? username,
  }) {
    return UserApiModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        imageFolder: imageFolder ?? this.imageFolder,
        username: username ?? this.username);
  }

  factory UserApiModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserApiModel(
      uid: doc.id,
      email: data['email'] ?? '',
      imageFolder: data['imageFolder'] ?? '',
      username: data['username'] ?? '',
    );
  }
  factory UserApiModel.empty() => const UserApiModel(
        uid: "",
        email: "",
        imageFolder: "",
        username: "",
      );
}
