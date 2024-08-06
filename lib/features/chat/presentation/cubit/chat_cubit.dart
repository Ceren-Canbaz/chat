import 'package:bloc/bloc.dart';
import 'package:chat/core/extensions/string_extensions.dart';
import 'package:chat/features/auth/domain/auth_repository.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:chat/features/chat/service/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final AuthRepository _authRepository;
  final ChatService _chatService;
  final String recieverId;

  ChatCubit(
      {required AuthRepository authRepository,
      required ChatService chatService,
      required this.recieverId})
      : _authRepository = authRepository,
        _chatService = chatService,
        super(
          ChatInitial(),
        );
  Future<void> sendMessage({required String message}) async {
    try {
      await _chatService.sendMessage(recieverId: recieverId, message: message);
    } catch (e) {}
  }

  Stream<QuerySnapshot<Message?>> getMessages({
    required String otherUserId,
  }) {
    final String userId = _authRepository.getCurrentUser()?.uid ?? "";

    return _chatService.getMessages(userId: userId, otherUserId: otherUserId);
  }

  Future<void> editMessage({
    required String messageId,
    required String messageContent,
  }) async {
    final String userId = _authRepository.getCurrentUser()?.uid ?? "";

    try {
      await _chatService.editMessage(
          otherUserId: recieverId,
          userId: userId,
          messageId: messageId,
          newMessageContent: messageContent);
    } catch (e) {
      print(e);

      ///implement error handling for ui
    }
  }

  Future<void> deleteMessage({
    required String messageId,
  }) async {
    final String userId = _authRepository.getCurrentUser()?.uid ?? "";

    try {
      await _chatService.deleteMessage(
        otherUserId: recieverId,
        userId: userId,
        messageId: messageId,
      );
    } catch (e) {
      print(e);

      ///implement error handling for ui
    }
  }
}
