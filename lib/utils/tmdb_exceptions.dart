part of tmdb_api;

///Encountered a null value
class NullValueException implements Exception {
  final String message;
  final String source;
  final String help;
  NullValueException(this.message,
      {this.source, this.help = 'try to pass a non null values'});

  @override
  String toString() {
    return 'NullValueException thrown message:$message | at source:$source | help:$help';
  }
}

///When constrains are not meet
class InvalidDataException implements Exception {
  final String message;
  final String source;
  final String help;
  InvalidDataException(this.message,
      {this.source, this.help = 'Data is invalid'});

  @override
  String toString() {
    return 'InvalidDataException thrown message:$message | at source:$source | help:$help';
  }
}
