import 'package:chat/core/exceptions/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RequestHandler {
  Future<T> call<T>(
    Future<T> Function() apiCall,
  ) async {
    try {
      return await apiCall();
    } on FirebaseAuthException catch (e) {
      // Firebase Authentication error codes
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException();
        case 'user-disabled':
          throw UserDisabledException();
        case 'user-not-found':
          throw UserNotFoundException();
        case 'wrong-password':
          throw WrongPasswordException();
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();
        case 'weak-password':
          throw WeakPasswordException();
        case 'operation-not-allowed':
          throw OperationNotAllowedException();
        case 'network-request-failed':
          throw NetworkRequestFailedException();
        case 'too-many-requests':
          throw TooManyRequestsException();
        case 'user-token-expired':
          throw UserTokenExpiredException();
        default:
          throw Exception();
      }
    } on JsonParsingException catch (_) {
      throw JsonParsingException();
    } catch (e) {
      rethrow;
    }
  }
}
