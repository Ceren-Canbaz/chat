import 'dart:async';

import 'package:chat/core/exceptions/exceptions.dart';
import 'package:chat/core/failures/failures.dart';
import 'package:dartz/dartz.dart';

class RepositoryExecuter {
  Future<Either<Failure, T>> executeWithError<T>(
    Future<T> Function() sourceCall,
  ) async {
    try {
      final T response = await sourceCall();
      return Right(response);
    } catch (e) {
      if (e is InvalidEmailException) {
        return Left(InvalidEmailFailure());
      } else if (e is UserDisabledException) {
        return Left(UserDisabledFailure());
      } else if (e is UserNotFoundException) {
        return Left(UserNotFoundFailure());
      } else if (e is WrongPasswordException) {
        return Left(WrongPasswordFailure());
      } else if (e is EmailAlreadyInUseException) {
        return Left(EmailAlreadyInUseFailure());
      } else if (e is WeakPasswordException) {
        return Left(WeakPasswordFailure());
      } else if (e is OperationNotAllowedException) {
        return Left(OperationNotAllowedFailure());
      } else if (e is NetworkRequestFailedException) {
        return Left(NetworkRequestFailedFailure());
      } else if (e is TooManyRequestsException) {
        return Left(TooManyRequestsFailure());
      } else if (e is UserTokenExpiredException) {
        return Left(UserTokenExpiredFailure());
      } else if (e is JsonParsingException) {
        return Left(JsonParsingFailure());
      } else {
        return Left(UnknownFailure());
      }
    }
  }

  Future<void> executeVoid(
    Future<void> Function() sourceCall,
  ) async {
    try {
      await sourceCall();
    } catch (e) {
      if (e is InvalidEmailException) {
        throw InvalidEmailFailure();
      } else if (e is UserDisabledException) {
        throw UserDisabledFailure();
      } else if (e is UserNotFoundException) {
        throw UserNotFoundFailure();
      } else if (e is WrongPasswordException) {
        throw WrongPasswordFailure();
      } else if (e is EmailAlreadyInUseException) {
        throw EmailAlreadyInUseFailure();
      } else if (e is WeakPasswordException) {
        throw WeakPasswordFailure();
      } else if (e is OperationNotAllowedException) {
        throw OperationNotAllowedFailure();
      } else if (e is NetworkRequestFailedException) {
        throw NetworkRequestFailedFailure();
      } else if (e is TooManyRequestsException) {
        throw TooManyRequestsFailure();
      } else if (e is UserTokenExpiredException) {
        throw UserTokenExpiredFailure();
      } else if (e is JsonParsingException) {
        throw JsonParsingFailure();
      } else {
        throw UnknownFailure();
      }
    }
  }

  Future<T> executeWithoutError<T>(
    Future<T> Function() sourceCall,
  ) async {
    try {
      final T response = await sourceCall();
      return response;
    } catch (e) {
      if (e is InvalidEmailException) {
        throw InvalidEmailFailure();
      } else if (e is UserDisabledException) {
        throw UserDisabledFailure();
      } else if (e is UserNotFoundException) {
        throw UserNotFoundFailure();
      } else if (e is WrongPasswordException) {
        throw WrongPasswordFailure();
      } else if (e is EmailAlreadyInUseException) {
        throw EmailAlreadyInUseFailure();
      } else if (e is WeakPasswordException) {
        throw WeakPasswordFailure();
      } else if (e is OperationNotAllowedException) {
        throw OperationNotAllowedFailure();
      } else if (e is NetworkRequestFailedException) {
        throw NetworkRequestFailedFailure();
      } else if (e is TooManyRequestsException) {
        throw TooManyRequestsFailure();
      } else if (e is UserTokenExpiredException) {
        throw UserTokenExpiredFailure();
      } else if (e is JsonParsingException) {
        throw JsonParsingFailure();
      } else {
        throw UnknownFailure();
      }
    }
  }
}
