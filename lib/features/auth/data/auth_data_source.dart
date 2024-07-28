import 'package:chat/core/handlers/request_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<UserCredential> signIn(
      {required String email, required String password});
  Future<void> logOut();
  Future<UserCredential> signUp(
      {required String email, required String password});
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RequestHandler _requestHandler = RequestHandler();
  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _requestHandler.call(() async {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

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

        return userCredential;
      },
    );
  }
}
