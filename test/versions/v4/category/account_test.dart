@Skip('Only manual tests are possible')
import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';
import '../../../init_script.dart' as user;

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  // const LIST_ID = 136441;
  const accessToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c';
  group('Account', () {
    test('Get lists', () async {
      final result = await tmdb.v4.account.getLists(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get Fav movies', () async {
      final result = await tmdb.v4.account.getFavoritMovies(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get Fav tv', () async {
      final result = await tmdb.v4.account.getFavoriteTvShows(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get movie rec', () async {
      final result = await tmdb.v4.account.getMovieRecommendations(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get tv rec', () async {
      final result = await tmdb.v4.account.getTvShowRecommendations(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get movie watchlist', () async {
      final result = await tmdb.v4.account.getMovieWatchList(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get tv watchlist', () async {
      final result = await tmdb.v4.account.getTvShowWatchList(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get Rated movie', () async {
      final result = await tmdb.v4.account.getRatedMovies(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });

    test('Get rated tv show', () async {
      final result = await tmdb.v4.account.getRatedTvShows(accessToken, user.User.userId!);
      print(result);

      expect(result.containsKey('results'), true);
    });
  });
}
