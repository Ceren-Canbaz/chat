import 'package:chat/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInput extends StatelessWidget {
  ChatInput({
    super.key,
  });

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.surface.withOpacity(
                      0.4,
                    ),
              ),
              onSubmitted: (value) {
                context.read<ChatCubit>().sendMessage(message: controller.text);
                controller.text = "";
              },
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          IconButton(
            onPressed: () {
              context.read<ChatCubit>().sendMessage(message: controller.text);
              controller.text = "";
            },
            icon: Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
