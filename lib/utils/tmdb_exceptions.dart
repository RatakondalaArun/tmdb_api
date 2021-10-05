part of tmdb_api;

///Base exception
class TMDBException implements Exception {
  final String message;
  final String? source;
  final String? help;
  TMDBException(this.message, {this.source, this.help});

  @override
  String toString() {
    return 'TMDBException() thrown message:$message | at source:$source | help:$help';
  }
}

///Encountered a null value.
@Deprecated('Removed infavor of nullsafety. Will be removed in v2.1.0')
class NullValueException extends TMDBException {
  @Deprecated('Removed infavor of nullsafety. Will be removed in v2.1.0')
  NullValueException(
    String message, {
    String? source,
    String help = 'try to pass a non null values',
  }) : super(message, source: source, help: help);

  @override
  String toString() {
    return 'NullValueException() thrown message:$message | at source:$source | help:$help';
  }
}

///When constrains are not meet
@Deprecated('Infavor of ArgumentException. Will be removed in v2.1.0')
class InvalidDataException extends TMDBException {
  @Deprecated('Infavor of ArgumentException. Will be removed in v2.1.0')
  InvalidDataException(
    String message, {
    String? source,
    String help = 'Data is invalid',
  }) : super(message, source: source, help: help);

  @override
  String toString() {
    return 'InvalidDataException() thrown message:$message | at source:$source | help:$help';
  }
}
