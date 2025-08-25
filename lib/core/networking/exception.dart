class CustomException implements Exception {
  final String message;
  final String prefix;

  CustomException(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message = 'Error During Communication'])
      : super(message, '');
}

class BadRequestException extends CustomException {
  BadRequestException([String message = 'Bad Request'])
      : super(message, '');
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String message = 'Unauthorised'])
      : super(message, '');
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message = 'Invalid Input'])
      : super(message, '');
}

class MaintenanceException extends CustomException {
  MaintenanceException([String message = 'Under Maintenance'])
      : super(message, '');
}