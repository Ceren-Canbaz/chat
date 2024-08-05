import 'package:chat/core/widgets/custom_appbar.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/chat/presentation/chat_message_list.dart';
import 'package:chat/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chat/features/chat/service/chat_service.dart';
import 'package:chat/services/injectable/injectable.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.user});
  final UserApiModel user;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        authRepository: locator<AuthRepository>(),
        chatService: locator<ChatService>(),
        recieverId: user.uid,
      ),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar.appBar(
              context: context,
              title: user.email,
              onTap: () {},
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Expanded(
                      child: buildMessageList(
                          receiverId: user.uid, context: context)),
                  SafeArea(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            onSubmitted: (value) {
                              context
                                  .read<ChatCubit>()
                                  .sendMessage(message: controller.text);
                              controller.text = "";
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<ChatCubit>()
                                .sendMessage(message: controller.text);
                            controller.text = "";
                          },
                          icon: const Icon(
                            Icons.send,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
