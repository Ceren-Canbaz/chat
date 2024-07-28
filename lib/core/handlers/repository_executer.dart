import 'dart:async';

import 'package:chat/core/exceptions/exceptions.dart';
import 'package:chat/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class RepositoryExecuter {
  Future<Either<Failure, T>> executeWithError<T>(
    Future<T> Function() sourceCall,
  ) async {
    try {
      final T response = await sourceCall();
      return Right(response);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return Left(InvalidEmailFailure());
        case 'user-disabled':
          return Left(UserDisabledFailure());
        case 'user-not-found':
          return Left(UserNotFoundFailure());
        case 'wrong-password':
          return Left(WrongPasswordFailure());
        case 'email-already-in-use':
          return Left(EmailAlreadyInUseFailure());
        case 'weak-password':
          return Left(WeakPasswordFailure());
        case 'operation-not-allowed':
          return Left(OperationNotAllowedFailure());
        case 'network-request-failed':
          return Left(NetworkRequestFailedFailure());
        case 'too-many-requests':
          return Left(TooManyRequestsFailure());
        case 'user-token-expired':
          return Left(UserTokenExpiredFailure());
        default:
          return Left(UnknownFailure());
      }
    } on JsonParsingException catch (_) {
      return Left(
        JsonParsingFailure(),
      );
    } catch (e) {
      return Left(
        UnknownFailure(),
      );
    }
  }

  Future<void> executeVoid(
    Future<void> Function() sourceCall,
  ) async {
    try {
      return await sourceCall();
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthExceptionToFailure(e);
    } on JsonParsingException catch (_) {
      throw JsonParsingFailure();
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Future<T> executeWithoutError<T>(
    Future<T> Function() sourceCall,
  ) async {
    try {
      final T response = await sourceCall();
      return response;
    } on FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthExceptionToFailure(e);
    } on JsonParsingException catch (_) {
      throw JsonParsingFailure();
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Failure _mapFirebaseAuthExceptionToFailure(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return InvalidEmailFailure();
      case 'user-disabled':
        return UserDisabledFailure();
      case 'user-not-found':
        return UserNotFoundFailure();
      case 'wrong-password':
        return WrongPasswordFailure();
      case 'email-already-in-use':
        return EmailAlreadyInUseFailure();
      case 'weak-password':
        return WeakPasswordFailure();
      case 'operation-not-allowed':
        return OperationNotAllowedFailure();
      case 'network-request-failed':
        return NetworkRequestFailedFailure();
      case 'too-many-requests':
        return TooManyRequestsFailure();
      case 'user-token-expired':
        return UserTokenExpiredFailure();
      default:
        return UnknownFailure();
    }
  }
}
