import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Reviews', () {
    test('details', () async {
      final result =
          await tmdb.v3.reviews.getDetails('5488c29bc3a3686f4a00004a');
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
