import 'package:test/test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('Discover', () {
    group('Movie', () {
      test('without prameters', () async {
        Map result = await tmdb.v3.discover.getMovies();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('withParameters', () async {
        Map result = await tmdb.v3.discover.getMovies(region: 'IN');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv shows', () {
      test('without prameters', () async {
        Map result = await tmdb.v3.discover.getTvShows();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('withParameters', () async {
        Map result =
            await tmdb.v3.discover.getTvShows(page: 2, voteCountGte: 560);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}