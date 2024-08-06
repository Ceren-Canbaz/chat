import 'package:chat/core/extensions/string_extensions.dart';
import 'package:chat/core/handlers/request_handler.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/chat/data/chat_data_source.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatService)
class ChatServiceImpl implements ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RequestHandler _requestHandler = RequestHandler();
  @override
  Stream<List<UserApiModel>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((event) {
      return event.docs.map((e) {
        return UserApiModel.fromFirestore(e);
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(
      {required String recieverId, required String message}) async {
    return await _requestHandler.call(() async {
      final String currentUserId = _auth.currentUser!.uid;
      final String currentUserEmail = _auth.currentUser!.email ?? "";
      final UserApiModel user = UserApiModel(
        uid: currentUserId,
        email: currentUserEmail,
        imageFolder: "",
        username: "",
      );
      final Timestamp timestamp = Timestamp.now();
      final Message newMessage = Message(
          senderId: user.uid,
          senderEmail: user.email,
          recieverId: recieverId,
          message: message,
          isMe: currentUserId == user.uid,
          timestamp: timestamp);
      List<String> ids = [user.uid, recieverId];
      ids.sort();
      final String chatRoomId = ids.join('_');

      await _firestore
          .collection("chat_rooms")
          .doc(chatRoomId)
          .collection("messages")
          .add(
            newMessage.toMap(),
          );
    });
  }

  @override
  Stream<QuerySnapshot<Message?>> getMessages(
      {required String userId, required String otherUserId}) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .withConverter<Message>(
      fromFirestore: (snapshot, _) {
        final data = snapshot.data()!;
        return Message.fromMap(data).copyWith(
          isMe: data["senderId"] == userId,
        );
      },
      toFirestore: (value, options) {
        return {};
      },
    ).snapshots();
  }

  @override
  Future<void> editMessage(
      {required String userId,
      required String otherUserId,
      required String messageId,
      required String newMessageContent}) async {
    return await _requestHandler.call(
      () async {
        List<String> ids = [userId, otherUserId];
        final chatRoomId = ids.sortAndJoin();
        await _firestore
            .collection("chat_rooms")
            .doc(chatRoomId)
            .collection("messages")
            .doc(messageId)
            .update(
          {
            'message': newMessageContent,
          },
        );
      },
    );
  }

  @override
  Future<void> deleteMessage({
    required String userId,
    required String otherUserId,
    required String messageId,
  }) async {
    return await _requestHandler.call(() async {
      List<String> ids = [userId, otherUserId];
      final chatRoomId = ids.sortAndJoin();
      await _firestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .doc(messageId)
          .delete();
    });
  }
}
