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
