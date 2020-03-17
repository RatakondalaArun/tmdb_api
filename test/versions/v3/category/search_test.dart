import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('Search', () {
    group('Company', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.v3.search.queryCompanies('Sony Pictures');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.v3.search.queryCompanies(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
    });
    group('collections', () {
      test('WithOut parameters', () async {
        Map result =
            await tmdb.v3.search.queryCollections('The Fast and the Furious');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.v3.search.queryCollections(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
    });
    group('Keywords', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.v3.search.queryKeywords('alien');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.v3.search.queryKeywords(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
    });
    group('Movies', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.v3.search.queryMovies('The Avengers');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.v3.search.queryMovies(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
      test('with parameters', () async {
        Map result = await tmdb.v3.search
            .queryMovies('The Avengers', year: 2019, region: 'UK');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Multi Serch', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.v3.search.queryMulti('The Avengers');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.v3.search.queryMulti(null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
      test('with parameters', () async {
        Map result =
            await tmdb.v3.search.queryMulti('The Avengers', region: 'UK');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('People', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.v3.search.queryPeople('Bradley Cooper');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.v3.search.queryPeople(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
      test('with parameters', () async {
        Map result =
            await tmdb.v3.search.queryPeople('Bradley Cooper', region: 'UK');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv shows', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.v3.search.queryTvShows('Silicon Valley');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.v3.search.queryTvShows(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
      test('with parameters', () async {
        Map result =
            await tmdb.v3.search.queryTvShows('Silicon Valley', page: 2);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
