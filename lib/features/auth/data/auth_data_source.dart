import 'package:chat/core/handlers/request_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<UserCredential> signIn(
      {required String email, required String password});
  Future<void> logOut();
  Future<UserCredential> signUp(
      {required String email, required String password});
  User? getCurrentUser();
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RequestHandler _requestHandler = RequestHandler();
  @override
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _requestHandler.call(() async {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email
      });
      return userCredential;
    });
  }

  @override
  Future<void> logOut() async {
    return await _requestHandler.call(() async {
      return await _auth.signOut();
    });
  }

  @override
  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    return await _requestHandler.call(
      () async {
        final UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        _firestore.collection("Users").doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email
        });

        return userCredential;
      },
    );
  }
}
