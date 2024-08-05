import 'package:chat/core/extensions/date_extensions.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget buildMessageItem(
    {required DocumentSnapshot doc, required BuildContext context}) {
  final data = doc.data() as Message;

  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 4,
    ),
    child: Align(
      alignment: data.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            data.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: data.isMe
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.4)
                  : Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              data.message,
              textAlign: TextAlign.start,
            ),
          ),
          Align(
            alignment: data.isMe ? Alignment.bottomRight : Alignment.bottomLeft,
            child: Text(
              data.timestamp.toDate().formatDate,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    ),
  );
}
