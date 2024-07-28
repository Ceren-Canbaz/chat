import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class ChatService {
  Stream<List<Map<String, dynamic>>> getUsersStream();
}

@LazySingleton(as: ChatService)
class ChatServiceImpl implements ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((event) {
      return event.docs.map((e) {
        final user = e.data();
        return user;
      }).toList();
    });
  }
}
