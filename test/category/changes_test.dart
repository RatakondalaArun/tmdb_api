import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Changes', () {
    group('movie', () {
      test('without prameters', () async {
        Map result = await tmdb.changes.getMovieList();
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        Map result =
            await tmdb.changes.getMovieList(parameters: Parameters(page: 1));
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
    });
    group('tv', () {
      test('without prameters', () async {
        Map result = await tmdb.changes.getTvList();
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        Map result =
            await tmdb.changes.getTvList(parameters: Parameters(page: 1));
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
    });
    group('person', () {
      test('without prameters', () async {
        Map result = await tmdb.changes.getPersonList();
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
      test('with prameters', () async {
        Map result =
            await tmdb.changes.getPersonList(parameters: Parameters(page: 1));
        assert(result is Map);
        assert(!result.containsKey('status_code'));
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
