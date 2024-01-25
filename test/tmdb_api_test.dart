@Skip('No tests')
library;

import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('TMDB testing', () {
    print('core testing not implemented for $tmdb');
  });
}
