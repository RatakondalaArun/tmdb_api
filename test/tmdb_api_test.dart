import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_api/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('TMDB testing', () {
    print('core testing not implemented for $tmdb');
  });
}
