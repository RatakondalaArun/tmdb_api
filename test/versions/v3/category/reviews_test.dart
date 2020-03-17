import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API, null);
  group('Reviews', () {
    test('details', () async {
      Map result = await tmdb.v3.reviews.getDetails('5488c29bc3a3686f4a00004a');
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
    test('Null value', () async {
      try {
        await tmdb.v3.reviews.getDetails(null);
      } catch (e) {
        expect(e is NullValueException, true);
      }
    });
  });
}
