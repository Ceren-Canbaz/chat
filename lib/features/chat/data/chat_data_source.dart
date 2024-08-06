import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatService {
  Stream<List<UserApiModel>> getUsersStream();
  Future<void> sendMessage({
    required String recieverId,
    required String message,
  });
  Stream<QuerySnapshot<Message?>> getMessages({
    required String userId,
    required String otherUserId,
  });
  Future<void> editMessage(
      {required String userId,
      required String otherUserId,
      required String messageId,
      required String newMessageContent});
  Future<void> deleteMessage({
    required String userId,
    required String otherUserId,
    required String messageId,
  });
}
