import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Geners', () {
    test('movie', () async {
      final result = await tmdb.v3.genres.getMovieList();

      expect(result.containsKey('status_code'), false);
    });
    test('tv', () async {
      final result = await tmdb.v3.genres.getTvlist();

      expect(result.containsKey('status_code'), false);
    });
  });
}
