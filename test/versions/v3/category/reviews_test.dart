import 'package:test/test.dart';
import '../../../init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Reviews', () {
    test('details', () async {
      Map result = await tmdb.v3.reviews.getDetails('5488c29bc3a3686f4a00004a');
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
