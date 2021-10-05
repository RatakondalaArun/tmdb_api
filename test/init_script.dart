import 'dart:io' show Platform;

// ignore_for_file: avoid_classes_with_only_static_members
class Keys {
  //added your API Keys for local test
  static String? apiV3 = Platform.environment['API_V3'];
  //added your API Keys for local test
  static String? apiV4 = Platform.environment['API_V4'];
}

class User {
  static String? username = Platform.environment['USERNAME'];
  static String? password = Platform.environment['PASSWORD'];

  /// TMDB UserId
  static String? userId = Platform.environment['USER_TMDB_ID'];
}
