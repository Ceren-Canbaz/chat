import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;

  const User({required this.uid, required this.email});

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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
    );
  }

  User copyWith({
    String? uid,
    String? email,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
    );
  }
}
