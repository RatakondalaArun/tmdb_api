import 'package:test/test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('Trending', () {
    test('WithOut parameters', () async {
      Map result = await tmdb.v3.trending.getTrending();
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
    test('with parameters', () async {
      Map result = await tmdb.v3.trending
          .getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
  });
}
