import 'package:chat/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:chat/features/chat/presentation/cubit/chat_cubit.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildMessageList(
    {required String receiverId, required BuildContext context}) {
  return StreamBuilder(
    stream: context.read<ChatCubit>().getMessages(otherUserId: receiverId),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text(
          snapshot.error.toString(),
        );
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      return ListView(
        reverse: true,
        children: snapshot.data!.docs.reversed
            .toList()
            .map(
              (e) => buildMessageItem(
                doc: e,
                context: context,
              ),
            )
            .toList(),
      );
    },
  );
}
