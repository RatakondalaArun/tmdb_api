@Skip('Only manual tests are possible Because of auth tokens')

import 'package:test/test.dart';
import '../../../init_script.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Account', () {
    test('without prameters', () async {
      final result = await tmdb.v3.account
          .getDetails('5129b38561c99f577bd85cc7f2ff47bb79735902');
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    group('get Created Lists', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getCreatedLists(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('get Favorite movies', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getFavoriteMovies(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('get Favorite tv', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getFavoriteTvShows(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('mark Favorite', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.markAsFavorite(
            '5129b38561c99f577bd85cc7f2ff47bb79735902',
            8890102,
            550,
            MediaType.movie);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('status_message'), true);
      });
    });

    group('rated movies', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getRatedMovies(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('results'), true);
      });
    });

    group('rated tv shows', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getRatedTvShows(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('results'), true);
      });
    });

    group('rated tv Episodes', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getRatedTvEpisodes(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('results'), true);
      });
    });

    group('get movie watchlist', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getMovieWatchList(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('results'), true);
      });
    });

    group('get tv watchlist', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.getTvShowWatchList(
            '5129b38561c99f577bd85cc7f2ff47bb79735902', 8890102);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('results'), true);
      });
    });

    group('add to watchlist', () {
      test('without prameters', () async {
        final result = await tmdb.v3.account.addToWatchList(
          '5129b38561c99f577bd85cc7f2ff47bb79735902',
          8890102,
          34,
          MediaType.tv,
        );
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('status_message'), true);
      });
    });
  });
}
