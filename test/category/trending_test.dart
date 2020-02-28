import 'package:flutter_test/flutter_test.dart';

import '../../lib/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Trending', () {
    test('WithOut parameters', () async {
      Map result = await tmdb.trending.getTrending();
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
    test('with parameters', () async {
      Map result = await tmdb.trending
          .getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
  });
}
