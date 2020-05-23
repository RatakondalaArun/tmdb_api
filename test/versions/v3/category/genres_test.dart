import 'package:test/test.dart';
import '../../../init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('Geners', () {
    test('movie', () async {
      Map result = await tmdb.v3.geners.getMovieList();
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('tv', () async {
      Map result = await tmdb.v3.geners.getTvlist();
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
