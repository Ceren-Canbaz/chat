import 'package:chat/core/extensions/date_extensions.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:chat/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildMessageItem(
    {required DocumentSnapshot doc,
    required BuildContext context,
    required ChatCubit cubit}) {
  final data = doc.data() as Message;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Align(
      alignment: data.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPressStart: (details) {
          _showPopupMenu(context, details.globalPosition, doc, cubit);
        },
        child: Column(
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
              alignment:
                  data.isMe ? Alignment.bottomRight : Alignment.bottomLeft,
              child: Text(
                data.timestamp.toDate().formatDate,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showPopupMenu(BuildContext context, Offset position, DocumentSnapshot doc,
    ChatCubit cubit) {
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
      position.dx,
      position.dy,
      MediaQuery.of(context).size.width - position.dx, // Right position
      MediaQuery.of(context).size.height - position.dy, // Bottom position
    ),
    items: [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit'),
          onTap: () {
            Navigator.pop(context);
            _showEditDialog(context, doc, cubit);
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.delete),
          title: Text('Delete'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    ],
  );
}

void _showEditDialog(
    BuildContext context, DocumentSnapshot doc, ChatCubit cubit) {
  final data = doc.data() as Message;
  TextEditingController _controller = TextEditingController(text: data.message);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit Message'),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter new message'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          BlocProvider.value(
            value: cubit,
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () async {
                    final updatedMessage = _controller.text;
                    await context.read<ChatCubit>().editMessage(
                        messageId: doc.id, messageContent: updatedMessage);

                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
