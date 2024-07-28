// Hata sınıfları
class InvalidEmailException implements Exception {}

class UserDisabledException implements Exception {}

class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

class EmailAlreadyInUseException implements Exception {}

class WeakPasswordException implements Exception {}

class OperationNotAllowedException implements Exception {}

class NetworkRequestFailedException implements Exception {}

class TooManyRequestsException implements Exception {}

class UserTokenExpiredException implements Exception {}

class JsonParsingException implements Exception {}
