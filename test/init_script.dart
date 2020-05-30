import '../lib/keys.dart' as key;
import 'dart:io' show Platform;

class Keys {
  static String API = Platform.environment['API_V3'] ?? key.Keys.API;
  static String API_V4 = Platform.environment['API_V4'] ?? key.Keys.API_V4;
}
