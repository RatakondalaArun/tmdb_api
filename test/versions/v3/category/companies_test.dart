import 'package:test/test.dart';
import '../../../init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('Companies', () {
    test('Details', () async {
      Map result = await tmdb.v3.companies.getDetails(1);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Alternative names', () async {
      Map result = await tmdb.v3.companies.getAlternativeNames(3);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Images', () async {
      Map result = await tmdb.v3.companies.getImages(1);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
