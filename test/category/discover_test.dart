import 'package:flutter_test/flutter_test.dart';

import '../../lib/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Discover', () {
    group('Movie', () {
      test('without prameters', () async {
        Map result = await tmdb.discover.getMovies();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('withParameters', () async {
        Map result = await tmdb.discover.getMovies(region: 'IN');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv shows', () {
      test('without prameters', () async {
        Map result = await tmdb.discover.getTvShows();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('withParameters', () async {
        Map result = await tmdb.discover.getTvShows(page: 2, voteCountGte: 560);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
