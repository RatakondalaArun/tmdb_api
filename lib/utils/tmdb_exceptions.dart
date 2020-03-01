part of tmdb_api;

///Encountered a null value
class NullValueException implements Exception {
  final String message;
  final String source;
  final String help;
  NullValueException(this.message, {this.source, this.help});

  @override
  String toString() {
    return 'NullValueException thrown message:$message | at source:$source | help:$help';
  }
}
