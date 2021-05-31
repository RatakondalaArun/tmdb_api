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

// todo: replace with ArgumentError
///Encountered a null value
class NullValueException extends TMDBException {
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

// todo: replace with ArgumentError
///When constrains are not meet
class InvalidDataException extends TMDBException {
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

/// Socket exception from TMDB
// todo: remove
@Deprecated('Removed to support flutter web platform')
class TMDBSocketException extends TMDBException {
  TMDBSocketException(
    String message, {
    String? source,
    String help = 'Check your internet connection.',
  }) : super(message, source: source, help: help);
  @override
  String toString() {
    return 'TMDBSocketException(message: $message,source: $source, help: $help)';
  }
}
