import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String senderId;
  final String senderEmail;
  final String recieverId;
  final String message;
  final Timestamp timestamp;

  const Message(
      {required this.senderId,
      required this.senderEmail,
      required this.recieverId,
      required this.message,
      required this.timestamp});
  @override
  List<Object?> get props =>
      [senderId, senderEmail, recieverId, message, timestamp];

  Message copyWith({
    String? senderId,
    String? senderEmail,
    String? recieverId,
    String? message,
    Timestamp? timestamp,
  }) {
    return Message(
      senderId: senderId ?? this.senderId,
      senderEmail: senderEmail ?? this.senderEmail,
      recieverId: recieverId ?? this.recieverId,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'recieverId': recieverId,
      'message': message,
      'timestamp': timestamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
        senderId: map['senderId'] ?? '',
        senderEmail: map['senderEmail'] ?? '',
        recieverId: map['recieverId'] ?? '',
        message: map['message'] ?? '',
        timestamp: Timestamp.fromDate(map['timestamp']) //??,
        );
  }
}
