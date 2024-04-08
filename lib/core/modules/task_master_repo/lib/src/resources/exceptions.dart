import 'package:equatable/equatable.dart';

/// general app exception
class AppException extends Equatable implements Exception {

  ///
  const AppException([this._message = '']);

  final String _message;
  ///
  String get message => _message;

  @override
  String toString() {
    return _message;
  }

  @override
  List<Object?> get props => [_message];
}

///
class FetchDataException extends AppException {
  ///
  FetchDataException({String? message})
      : super( message = message ?? 'Unknown Error');
}

/// exception to be thrown when there is no internet connectivity
class NoInternetException extends AppException {
  ///
  const NoInternetException();
}


/// exception to be thrown when there on Bad Request
class BadRequestException extends AppException {
  ///
  BadRequestException({String? message})
      : super( message = 'Bad Request');
}

/// exception to be thrown when user is not authorized
class UnauthorisedException extends AppException {
  ///
  UnauthorisedException({String? message})
      : super( message = 'Unauthorised');
}

/// exception to be thrown when user is not authorized
class ForbiddenException extends AppException {
  ///
  ForbiddenException({String? message})
      : super( message = 'Unauthorised');
}

/// exception to be thrown when resource not found
class NotFoundException extends AppException {
  ///
  NotFoundException({String? message})
      : super( message = 'NotFound');
}


/// exception to be thrown when server responds with 500 error
class ServerErrorException extends AppException {
  ///
  ServerErrorException({String? message})
      : super( message = 'Server Error');
}
