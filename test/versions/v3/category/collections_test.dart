import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Collections', () {
    test('details', () async {
      final result = await tmdb.v3.collections.getDetails(10);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('images', () async {
      final result = await tmdb.v3.collections.getImages(10);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Translations', () async {
      final result = await tmdb.v3.collections.getTranslations(10);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
