import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Changes', () {
    group('movie', () {
      test('without prameters', () async {
        Map result = await tmdb.v3.changes.getMovieList();
        expect(result is Map, true);

        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        Map result = await tmdb.v3.changes.getMovieList(page: 2);
        expect(result is Map, true);

        expect(result.containsKey('status_code'), false);
      });
    });
    group('tv', () {
      test('without prameters', () async {
        Map result = await tmdb.v3.changes.getTvList();
        expect(result is Map, true);

        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        Map result = await tmdb.v3.changes.getTvList(page: 2);
        expect(result is Map, true);

        expect(result.containsKey('status_code'), false);
      });
    });
    group('person', () {
      test('without prameters', () async {
        Map result = await tmdb.v3.changes.getPersonList();
        expect(result is Map, true);

        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        Map result = await tmdb.v3.changes.getPersonList(page: 1);
        expect(result is Map, true);

        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
