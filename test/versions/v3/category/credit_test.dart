import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API, null);
  group('Credit', () {
    test('without prameters', () async {
      Map result = await tmdb.v3.credit.getDetails('52542282760ee313280017f9');
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
  });
}
