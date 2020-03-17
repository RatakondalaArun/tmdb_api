import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API, null);
  group('Keyword', () {
    test('Details', () async {
      Map result = await tmdb.v3.keywords.getDetails(3417);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('tv', () async {
      Map result = await tmdb.v3.keywords.getMovies(3417);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
