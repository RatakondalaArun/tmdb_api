import 'package:test/test.dart';
import '../../../init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
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
