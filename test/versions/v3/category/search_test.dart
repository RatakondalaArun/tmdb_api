import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Search', () {
    group('Company', () {
      test('WithOut parameters', () async {
        final result = await tmdb.v3.search.queryCompanies('Sony Pictures');

        expect(result.containsKey('status_code'), false);
      });
    });
    group('collections', () {
      test('WithOut parameters', () async {
        final result = await tmdb.v3.search.queryCollections('The Fast and the Furious');

        expect(result.containsKey('status_code'), false);
      });
    });
    group('Keywords', () {
      test('WithOut parameters', () async {
        final result = await tmdb.v3.search.queryKeywords('alien');

        expect(result.containsKey('status_code'), false);
      });
    });
    group('Movies', () {
      test('WithOut parameters', () async {
        final result = await tmdb.v3.search.queryMovies('The Avengers');

        expect(result.containsKey('status_code'), false);
      });

      test('with parameters', () async {
        final result = await tmdb.v3.search.queryMovies('The Avengers', year: 2019, region: 'UK');

        expect(result.containsKey('status_code'), false);
      });
    });
    group('Multi Serch', () {
      test('WithOut parameters', () async {
        final result = await tmdb.v3.search.queryMulti('The Avengers');

        expect(result.containsKey('status_code'), false);
      });

      test('with parameters', () async {
        final result = await tmdb.v3.search.queryMulti('The Avengers', region: 'UK');

        expect(result.containsKey('status_code'), false);
      });
    });
    group('People', () {
      test('WithOut parameters', () async {
        final result = await tmdb.v3.search.queryPeople('Bradley Cooper');

        expect(result.containsKey('status_code'), false);
      });

      test('with parameters', () async {
        final result = await tmdb.v3.search.queryPeople('Bradley Cooper', region: 'UK');

        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv shows', () {
      test('WithOut parameters', () async {
        final result = await tmdb.v3.search.queryTvShows('Silicon Valley');

        expect(result.containsKey('status_code'), false);
      });
      test('with parameters', () async {
        final result = await tmdb.v3.search.queryTvShows('Silicon Valley', page: 2);

        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
