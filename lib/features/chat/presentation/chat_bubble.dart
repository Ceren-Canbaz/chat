import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget buildMessageItem({required DocumentSnapshot doc}) {
  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  return Text(data["message"]);
}
