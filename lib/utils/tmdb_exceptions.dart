part of '../tmdb_api.dart';

///Base exception
class TMDBException<T> implements Exception {
  final String message;
  final T? orginal;
  final StackTrace? stackTrace;

  const TMDBException(this.message, {this.orginal, this.stackTrace});

  @override
  String toString() => 'TMDBException(message: $message, orginal: $orginal, stackTrace: $stackTrace)';
}

class TMDBDioError extends TMDBException<DioException> {
  final int? statusCode;

  const TMDBDioError(
    super.message, {
    required DioException super.orginal,
    this.statusCode,
  });

  @override
  String toString() => 'TMDBDioError(message: $message,orginal:$orginal, statusCode: $statusCode)';
}

class TMDBOtherException extends TMDBException<dynamic> {
  const TMDBOtherException(
    super.message, {
    super.orginal,
    super.stackTrace,
  });
  @override
  String toString() => 'TMDBDioError(message: $message,orginal:$orginal, stackTrace:$stackTrace)';
}
