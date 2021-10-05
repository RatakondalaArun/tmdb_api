import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Discover', () {
    group('Movie', () {
      test('without prameters', () async {
        final result = await tmdb.v3.discover.getMovies();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('withParameters', () async {
        final result =
            await tmdb.v3.discover.getMovies(region: 'IN', withGenres: '28');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv shows', () {
      test('without prameters', () async {
        final result = await tmdb.v3.discover.getTvShows();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('withParameters', () async {
        final result =
            await tmdb.v3.discover.getTvShows(page: 2, voteCountGte: 560);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
