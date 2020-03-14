import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Certification', () {
    test('movie', () async {
      Map result = await tmdb.v3.certification.getMovie();
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
    test('TV', () async {
      Map result = await tmdb.v3.certification.getTv();
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
  });
}
