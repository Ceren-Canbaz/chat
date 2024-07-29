import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserApiModel extends Equatable {
  final String uid;
  final String email;

  const UserApiModel({required this.uid, required this.email});

  @override
  List<Object?> get props => [
        uid,
        email,
      ];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  UserApiModel copyWith({
    String? uid,
    String? email,
  }) {
    return UserApiModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
    );
  }
}
