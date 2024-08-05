import 'package:chat/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget buildMessageItem({required DocumentSnapshot doc}) {
  final data = doc.data() as Message;

  return Align(
      alignment: data.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Text(data.isMe.toString()));
}
