// Hata sınıfları
class InvalidEmailException implements Exception {
  final String message;
  InvalidEmailException(this.message);
}

class UserDisabledException implements Exception {
  final String message;
  UserDisabledException(this.message);
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
}

class WrongPasswordException implements Exception {
  final String message;
  WrongPasswordException(this.message);
}

class EmailAlreadyInUseException implements Exception {
  final String message;
  EmailAlreadyInUseException(this.message);
}

class WeakPasswordException implements Exception {
  final String message;
  WeakPasswordException(this.message);
}

class OperationNotAllowedException implements Exception {
  final String message;
  OperationNotAllowedException(this.message);
}

class NetworkRequestFailedException implements Exception {
  final String message;
  NetworkRequestFailedException(this.message);
}

class TooManyRequestsException implements Exception {
  final String message;
  TooManyRequestsException(this.message);
}

class UserTokenExpiredException implements Exception {
  final String message;
  UserTokenExpiredException(this.message);
}

class JsonParsingException implements Exception {
  final String message;
  JsonParsingException(this.message);
}
