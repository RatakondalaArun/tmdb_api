import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API, Keys.API_V4);
  // const LIST_ID = 136441;
  const String ACCESS_TOKEN =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c';
  group('Account', () {
    test('Get lists', () async {
      Map result =
          await tmdb.v4.account.getLists(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get Fav movies', () async {
      Map result = await tmdb.v4.account
          .getFavoritMovies(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get Fav tv', () async {
      Map result = await tmdb.v4.account
          .getFavoriteTvShows(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get movie rec', () async {
      Map result = await tmdb.v4.account
          .getMovieRecommendations(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get tv rec', () async {
      Map result = await tmdb.v4.account
          .getTvShowRecommendations(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get movie watchlist', () async {
      Map result = await tmdb.v4.account
          .getMovieWatchList(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get tv watchlist', () async {
      Map result = await tmdb.v4.account
          .getTvShowWatchList(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get Rated movie', () async {
      Map result =
          await tmdb.v4.account.getRatedMovies(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });

    test('Get rated tv show', () async {
      Map result = await tmdb.v4.account
          .getRatedTvShows(ACCESS_TOKEN, User.USER_TMDB_ID);
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('results'), true);
    });
  });
}
