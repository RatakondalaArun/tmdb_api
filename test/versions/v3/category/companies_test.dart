import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Companies', () {
    test('Details', () async {
      final result = await tmdb.v3.companies.getDetails(1);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Alternative names', () async {
      final result = await tmdb.v3.companies.getAlternativeNames(3);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Images', () async {
      final result = await tmdb.v3.companies.getImages(1);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
