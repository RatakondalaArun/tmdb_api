part of tmdb_api;

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
    String message, {
    required DioException orginal,
    this.statusCode,
  }) : super(message, orginal: orginal);

  @override
  String toString() => 'TMDBDioError(message: $message,orginal:$orginal, statusCode: $statusCode)';
}

class TMDBOtherException extends TMDBException<dynamic> {
  const TMDBOtherException(
    String message, {
    dynamic orginal,
    StackTrace? stackTrace,
  }) : super(message, orginal: orginal, stackTrace: stackTrace);
  @override
  String toString() => 'TMDBDioError(message: $message,orginal:$orginal, stackTrace:$stackTrace)';
}
