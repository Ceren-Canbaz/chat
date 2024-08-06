import 'package:chat/core/failures/failures.dart';
import 'package:chat/core/handlers/repository_executer.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:chat/features/chat/data/source/chat_data_source.dart';
import 'package:chat/features/chat/domain/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final RepositoryExecuter _repositoryExecuter = RepositoryExecuter();
  final ChatDataSource _src;

  ChatRepositoryImpl({required ChatDataSource src}) : _src = src;
  @override
  Future<Either<Failure, void>> deleteMessage(
      {required String userId,
      required String otherUserId,
      required String messageId}) async {
    return await _repositoryExecuter.executeWithError(() async {
      return await _src.deleteMessage(
          userId: userId, otherUserId: otherUserId, messageId: messageId);
    });
  }

  @override
  Future<Either<Failure, void>> editMessage(
      {required String userId,
      required String otherUserId,
      required String messageId,
      required String newMessageContent}) async {
    return await _repositoryExecuter.executeWithError(() async {
      return await _src.editMessage(
          userId: userId,
          otherUserId: otherUserId,
          messageId: messageId,
          newMessageContent: newMessageContent);
    });
  }

  @override
  Stream<QuerySnapshot<Message?>> getMessages(
      {required String userId, required String otherUserId}) {
    return _src.getMessages(userId: userId, otherUserId: otherUserId);
  }

  @override
  Stream<List<UserApiModel>> getUsersStream() {
    return _src.getUsersStream();
  }

  @override
  Future<Either<Failure, void>> sendMessage(
      {required String recieverId, required String message}) async {
    return await _repositoryExecuter.executeWithError(() async {
      return await _src.sendMessage(recieverId: recieverId, message: message);
    });
  }
}
