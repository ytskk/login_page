import 'dart:io';

import 'package:dio/dio.dart';

final class ApiHandler {
  static Future<T> get<T>(Future<T> Function() callback) async {
    try {
      final result = await callback();

      return result;
    } on DioError catch (e) {
      print(
          'throwing ApiNetworkDioException with message: ${e.message} and error: ${e.error}');

      if (e.type == DioErrorType.unknown) {
        if (e.error is SocketException) {
          throw ApiNetworkDioSocketException();
        }
      }

      throw ApiNetworkDioException(
        message: e.message ?? 'Unknown error',
        error: e.error,
      );
    } on ApiNetworkException catch (e) {
      throw ApiNetworkParsingException(
        message: e.toString(),
      );
    }
  }
}

interface class ApiNetworkException implements Exception {
  const ApiNetworkException({
    this.message,
  });

  final String? message;

  /// A message describing the parsing error. Combines [message] and error
  /// specific details such as additional fields, codes, and errors.
  ///
  /// Use that to override [toString] method.
  String? get localizedMessage => message;

  @override
  String toString() => '$runtimeType: $localizedMessage';
}

class ApiNetworkParsingException extends ApiNetworkException {
  const ApiNetworkParsingException({
    required super.message,
  });
}

class ApiNetworkDioException extends ApiNetworkException {
  const ApiNetworkDioException({
    required super.message,
    this.error,
  });

  final Object? error;

  @override
  String get localizedMessage {
    String errorString = '';

    if (error != null) {
      errorString = ', error: $error';
    }
    return errorString;
  }
}

class ApiNetworkDioSocketException extends ApiNetworkException {
  @override
  String get message =>
      'Check your internet connection or server is unavailable.';
}
