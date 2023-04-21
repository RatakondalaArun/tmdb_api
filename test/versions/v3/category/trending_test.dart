import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Trending', () {
    test('WithOut parameters', () async {
      final result = await tmdb.v3.trending.getTrending();

      expect(result.containsKey('status_code'), false);
    });
    test('with parameters', () async {
      final result = await tmdb.v3.trending.getTrending(mediaType: MediaType.movie, timeWindow: TimeWindow.week);

      expect(result.containsKey('status_code'), false);
    });
  });
}
