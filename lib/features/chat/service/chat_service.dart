import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class ChatService {
  Stream<List<UserApiModel>> getUsersStream();
}

@LazySingleton(as: ChatService)
class ChatServiceImpl implements ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<UserApiModel>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((event) {
      return event.docs.map((e) {
        final user = e.data();
        return UserApiModel(uid: user["uid"], email: user["email"]);
      }).toList();
    });
  }
}
