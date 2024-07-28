// Temel Failure sınıfı
abstract class Failure implements Exception {
  final String title;
  final String message;

  Failure(this.title, this.message);

  @override
  String toString() => '$title: $message';
}

class InvalidEmailFailure extends Failure {
  InvalidEmailFailure()
      : super('Invalid Email Failure', 'Invalid email address.');
}

class UserDisabledFailure extends Failure {
  UserDisabledFailure()
      : super('User Disabled Failure', 'User account has been disabled.');
}

class UserNotFoundFailure extends Failure {
  UserNotFoundFailure()
      : super('User Not Found Failure', 'No user found with this email.');
}

class WrongPasswordFailure extends Failure {
  WrongPasswordFailure()
      : super('Wrong Password Failure', 'Incorrect password.');
}

class EmailAlreadyInUseFailure extends Failure {
  EmailAlreadyInUseFailure()
      : super('Email Already In Use Failure', 'Email is already in use.');
}

class WeakPasswordFailure extends Failure {
  WeakPasswordFailure()
      : super('Weak Password Failure', 'Password is too weak.');
}

class OperationNotAllowedFailure extends Failure {
  OperationNotAllowedFailure()
      : super('Operation Not Allowed Failure', 'Operation not allowed.');
}

class NetworkRequestFailedFailure extends Failure {
  NetworkRequestFailedFailure()
      : super('Network Request Failed Failure', 'Network request failed.');
}

class TooManyRequestsFailure extends Failure {
  TooManyRequestsFailure()
      : super('Too Many Requests Failure',
            'Too many requests. Please try again later.');
}

class UserTokenExpiredFailure extends Failure {
  UserTokenExpiredFailure()
      : super('User Token Expired Failure', 'User token has expired.');
}

class JsonParsingFailure extends Failure {
  JsonParsingFailure()
      : super('JSON Parsing Failure', 'ERROR: Json Parsing Exception');
}

class UnknownFailure extends Failure {
  UnknownFailure() : super('Unknown Error', 'An unknown error occurred.');
}
