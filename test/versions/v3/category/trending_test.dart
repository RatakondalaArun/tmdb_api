import 'package:test/test.dart';
import '../../../init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('Trending', () {
    test('WithOut parameters', () async {
      Map result = await tmdb.v3.trending.getTrending();
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('with parameters', () async {
      Map result = await tmdb.v3.trending
          .getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
