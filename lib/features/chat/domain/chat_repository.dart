import 'package:chat/core/failures/failures.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepository {
  Stream<List<UserApiModel>> getUsersStream();
  Future<Either<Failure, void>> sendMessage({
    required String recieverId,
    required String message,
  });
  Stream<QuerySnapshot<Message?>> getMessages({
    required String userId,
    required String otherUserId,
  });
  Future<Either<Failure, void>> editMessage(
      {required String userId,
      required String otherUserId,
      required String messageId,
      required String newMessageContent});
  Future<Either<Failure, void>> deleteMessage({
    required String userId,
    required String otherUserId,
    required String messageId,
  });
}
