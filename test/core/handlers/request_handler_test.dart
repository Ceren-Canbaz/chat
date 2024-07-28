import 'package:chat/core/exceptions/exceptions.dart';
import 'package:chat/core/handlers/request_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock sınıfı
class MockApiCall extends Mock {
  Future<T> call<T>(Future<T> Function() apiCall) => apiCall();
}

class MockApiCallWithFallback extends Mock implements MockApiCall {}

void main() {
  late RequestHandler requestHandler;
  late MockApiCallWithFallback mockApiCall;

  setUp(() {
    mockApiCall = MockApiCallWithFallback();
    requestHandler = RequestHandler();

    registerFallbackValue(() => Future.value());
  });

  test('should throw InvalidEmailException for invalid-email error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'invalid-email'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'invalid-email');
      }),
      throwsA(isA<InvalidEmailException>()),
    );
  });

  test('should throw UserDisabledException for user-disabled error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'user-disabled'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'user-disabled');
      }),
      throwsA(isA<UserDisabledException>()),
    );
  });

  test('should throw UserNotFoundException for user-not-found error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'user-not-found'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'user-not-found');
      }),
      throwsA(isA<UserNotFoundException>()),
    );
  });

  test('should throw WrongPasswordException for wrong-password error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'wrong-password'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'wrong-password');
      }),
      throwsA(isA<WrongPasswordException>()),
    );
  });

  test(
      'should throw EmailAlreadyInUseException for email-already-in-use error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'email-already-in-use'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'email-already-in-use');
      }),
      throwsA(isA<EmailAlreadyInUseException>()),
    );
  });

  test('should throw WeakPasswordException for weak-password error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'weak-password'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'weak-password');
      }),
      throwsA(isA<WeakPasswordException>()),
    );
  });

  test(
      'should throw OperationNotAllowedException for operation-not-allowed error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'operation-not-allowed'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'operation-not-allowed');
      }),
      throwsA(isA<OperationNotAllowedException>()),
    );
  });

  test(
      'should throw NetworkRequestFailedException for network-request-failed error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'network-request-failed'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'network-request-failed');
      }),
      throwsA(isA<NetworkRequestFailedException>()),
    );
  });

  test('should throw TooManyRequestsException for too-many-requests error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'too-many-requests'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'too-many-requests');
      }),
      throwsA(isA<TooManyRequestsException>()),
    );
  });

  test(
      'should throw UserTokenExpiredException for user-token-expired error code',
      () async {
    when(() => mockApiCall.call(any()))
        .thenThrow(FirebaseAuthException(code: 'user-token-expired'));

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'user-token-expired');
      }),
      throwsA(isA<UserTokenExpiredException>()),
    );
  });
}
