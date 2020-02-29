import 'package:flutter_test/flutter_test.dart';

import '../../lib/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Search', () {
    group('Company', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.search.queryCompanies('Sony Pictures');
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.search.queryCompanies(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
    });
    group('collections', () {
      test('WithOut parameters', () async {
        Map result =
            await tmdb.search.queryCollections('The Fast and the Furious');
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.search.queryCollections(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
    });
    group('Keywords', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.search.queryKeywords('alien');
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.search.queryKeywords(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
    });
    group('Movies', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.search.queryMovies('The Avengers');
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.search.queryMovies(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
      test('with parameters', () async {
        Map result = await tmdb.search
            .queryMovies('The Avengers', year: 2019, region: 'UK');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Multi Serch', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.search.queryMulti('The Avengers');
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.search.queryMulti(null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
      test('with parameters', () async {
        Map result = await tmdb.search.queryMulti('The Avengers', region: 'UK');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('People', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.search.queryPeople('Bradley Cooper');
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.search.queryPeople(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
      test('with parameters', () async {
        Map result =
            await tmdb.search.queryPeople('Bradley Cooper', region: 'UK');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv shows', () {
      test('WithOut parameters', () async {
        Map result = await tmdb.search.queryTvShows('Silicon Valley');
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('Null value exception ', () async {
        try {
          await tmdb.search.queryTvShows(null);
        } catch (e) {
          assert(e is NullValueException);
        }
      });
      test('with parameters', () async {
        Map result = await tmdb.search
            .queryTvShows('Silicon Valley', parameters: Parameters(page: 2));
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
