import 'dart:io';

import 'package:dio/dio.dart';

final class ApiHandler {
  static Future<T> get<T>(Future<T> Function() callback) async {
    try {
      final result = await callback();

      return result;
    } on DioError catch (e) {
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

class ApiNetworkException implements Exception {
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
    super.message,
  });
}

class ApiNetworkDioException extends ApiNetworkException {
  const ApiNetworkDioException({
    super.message,
    this.error,
  });

  final Object? error;

  @override
  String get localizedMessage {
    final errorString =
        [message, error].where((messageType) => messageType != null).join(',');

    return errorString;
  }
}

class ApiNetworkDioSocketException extends ApiNetworkException {
  @override
  String get message =>
      'Check your internet connection or server is unavailable.';
}
