@Skip('No tests')

import 'package:test/test.dart';
import 'init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('TMDB testing', () {
    print('core testing not implemented for $tmdb');
  });
}
