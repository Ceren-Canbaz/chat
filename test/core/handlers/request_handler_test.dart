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
    when(() => mockApiCall.call(any())).thenThrow((invocation) async {
      throw FirebaseAuthException(code: 'invalid-email');
    });

    expectLater(
      () async => await requestHandler.call(() async {
        return throw FirebaseAuthException(code: 'invalid-email');
      }),
      throwsA(isA<InvalidEmailException>()),
    );
  });
}
