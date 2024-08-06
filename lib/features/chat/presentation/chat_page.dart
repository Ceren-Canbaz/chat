import 'package:chat/core/widgets/custom_appbar.dart';

import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/chat/presentation/widgets/chat_input.dart';
import 'package:chat/features/chat/presentation/widgets/chat_message_list.dart';
import 'package:chat/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chat/features/chat/data/source/chat_data_source.dart';
import 'package:chat/services/injectable/injectable.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.user});
  final UserApiModel user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(
        authRepository: locator<AuthRepository>(),
        chatService: locator<ChatDataSource>(),
        recieverId: user.uid,
      ),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppBar.appBar(
              context: context,
              title: user.email,
              child: SizedBox(
                height: 48,
                width: 48,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: "",
                    placeholderErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Theme.of(context).colorScheme.surface,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Theme.of(context).colorScheme.primary,
                              size: 34,
                            ),
                          ],
                        ),
                      );
                    },
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Theme.of(context).colorScheme.surface,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Theme.of(context).colorScheme.primary,
                              size: 34,
                            ),
                          ],
                        ),
                      );
                    },
                    image: user.imageFolder,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                  ChatInput(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
