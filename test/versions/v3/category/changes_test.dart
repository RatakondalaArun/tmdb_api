import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Changes', () {
    group('movie', () {
      test('without prameters', () async {
        final result = await tmdb.v3.changes.getMovieList();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        final result = await tmdb.v3.changes.getMovieList(page: 2);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('tv', () {
      test('without prameters', () async {
        final result = await tmdb.v3.changes.getTvList();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        final result = await tmdb.v3.changes.getTvList(page: 2);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('person', () {
      test('without prameters', () async {
        final result = await tmdb.v3.changes.getPersonList();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        final result = await tmdb.v3.changes.getPersonList(page: 2);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
