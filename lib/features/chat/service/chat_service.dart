import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';

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
}

@LazySingleton(as: ChatService)
class ChatServiceImpl implements ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Stream<List<UserApiModel>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((event) {
      return event.docs.map((e) {
        final user = e.data();
        return UserApiModel(
            uid: user["uid"],
            email: user["email"],
            imageFolder: user["imageFolder"] ?? "");
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(
      {required String recieverId, required String message}) async {
    try {
      final String currentUserId = _auth.currentUser!.uid;
      final String currentUserEmail = _auth.currentUser!.email ?? "";
      final UserApiModel user = UserApiModel(
          uid: currentUserId, email: currentUserEmail, imageFolder: "");
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
    } catch (e) {
      rethrow;
    }
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
}
