class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message);
}

class FetchDataException extends AppException {
  FetchDataException(String message) : super(message);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException(message) : super(message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message) : super(message);
}
