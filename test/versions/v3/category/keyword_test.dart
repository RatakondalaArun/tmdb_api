import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Keyword', () {
    test('Details', () async {
      final result = await tmdb.v3.keywords.getDetails(3417);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('tv', () async {
      final result = await tmdb.v3.keywords.getMovies(3417);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
