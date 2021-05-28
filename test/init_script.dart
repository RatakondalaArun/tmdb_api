import 'dart:io' show Platform;

class Keys {
  //added your API Keys for local test
  static String API = Platform.environment['API_V3'];
  //added your API Keys for local test
  static String API_V4 = Platform.environment['API_V4'];
}

class User {
  static String USERNAME = Platform.environment['USERNAME'];
  static String PASSWORD = Platform.environment['PASSWORD'];
  static String USER_TMDB_ID = Platform.environment['USER_TMDB_ID'];
}
