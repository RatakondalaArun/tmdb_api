import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API, null);
  group('Collections', () {
    test('details', () async {
      Map result = await tmdb.v3.collections.getDetails(10);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
    test('images', () async {
      Map result = await tmdb.v3.collections.getImages(10);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
    test('Translations', () async {
      Map result = await tmdb.v3.collections.getTranslations(10);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
  });
}
