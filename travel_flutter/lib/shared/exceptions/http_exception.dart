import 'package:dartz/dartz.dart';
import 'package:travel_flutter/shared/domain/models/response.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final String identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

//  extension
extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}

class NoConnectionException extends AppException {
  NoConnectionException(final String identifier)
    : super(message: 'No Connection', statusCode: 0, identifier: identifier);
}

class ServerException extends AppException {
  ServerException(final int statusCode, final String identifier)
    : super(
        message: 'Server Error',
        statusCode: statusCode,
        identifier: identifier,
      );
}
