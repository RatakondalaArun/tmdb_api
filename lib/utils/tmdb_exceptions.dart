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
class NullValueException implements TMDBException {
  final String message;
  final String? source;
  final String help;
  NullValueException(
    this.message, {
    this.source,
    this.help = 'try to pass a non null values',
  });

  @override
  String toString() {
    return 'NullValueException() thrown message:$message | at source:$source | help:$help';
  }
}

// todo: replace with ArgumentError
///When constrains are not meet
class InvalidDataException implements TMDBException {
  final String message;
  final String? source;
  final String help;
  InvalidDataException(
    this.message, {
    this.source,
    this.help = 'Data is invalid',
  });

  @override
  String toString() {
    return 'InvalidDataException() thrown message:$message | at source:$source | help:$help';
  }
}

/// Socket exception from TMDB
// todo: remove
@Deprecated('Removed to support flutter web platform')
class TMDBSocketException implements TMDBException {
  final String message;
  final String? source;
  final String help;
  TMDBSocketException(
    this.message, {
    this.source,
    this.help = 'Check your internet connection.',
  });
  @override
  String toString() {
    return 'TMDBSocketException(message: $message,source: $source, help: $help)';
  }
}
