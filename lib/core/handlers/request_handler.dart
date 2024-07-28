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
          throw InvalidEmailException('Invalid email address.');
        case 'user-disabled':
          throw UserDisabledException('User account has been disabled.');
        case 'user-not-found':
          throw UserNotFoundException('No user found with this email.');
        case 'wrong-password':
          throw WrongPasswordException('Incorrect password.');
        case 'email-already-in-use':
          throw EmailAlreadyInUseException('Email is already in use.');
        case 'weak-password':
          throw WeakPasswordException('Password is too weak.');
        case 'operation-not-allowed':
          throw OperationNotAllowedException('Operation not allowed.');
        case 'network-request-failed':
          throw NetworkRequestFailedException('Network request failed.');
        case 'too-many-requests':
          throw TooManyRequestsException(
              'Too many requests. Please try again later.');
        case 'user-token-expired':
          throw UserTokenExpiredException('User token has expired.');
        default:
          throw Exception('An unknown error occurred.');
      }
    } on JsonParsingException catch (_) {
      throw JsonParsingException("ERROR: Json Parsing Exception");
    } catch (e) {
      rethrow;
    }
  }
}
