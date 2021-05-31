import 'package:test/test.dart';
import '../../../init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Collections', () {
    test('details', () async {
      Map result = await tmdb.v3.collections.getDetails(10);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('images', () async {
      Map result = await tmdb.v3.collections.getImages(10);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Translations', () async {
      Map result = await tmdb.v3.collections.getTranslations(10);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
