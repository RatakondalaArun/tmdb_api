import 'package:test/test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_api/keys.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('TMDB testing', () {
    print('core testing not implemented for $tmdb');
  });
}
