import 'package:chat/features/auth/data/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  ///use dartz
  Future<UserCredential> signIn(
      {required String email, required String password});
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _src;

  AuthRepositoryImpl({required AuthDataSource src}) : _src = src;
  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _src.signIn(email: email, password: password);
  }
}
