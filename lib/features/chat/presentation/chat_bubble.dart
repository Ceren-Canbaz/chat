import 'package:chat/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget buildMessageItem(
    {required DocumentSnapshot doc, required BuildContext context}) {
  final data = doc.data() as Message;

  return Align(
    alignment: data.isMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width * 0.2,
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.isMe.toString(),
              textAlign: TextAlign.start,
            ),
            Text(
              data.timestamp.toDate().day.toString(),
            )
          ],
        ),
      ),
    ),
  );
}
