import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
}
