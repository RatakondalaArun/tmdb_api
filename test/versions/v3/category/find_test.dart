import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('Credit', () {
    test('without prameters', () async {
      Map result = await tmdb.v3.find.getById('tt8579674');
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
    test('parameter link test', () async {
      Map result = await tmdb.v3.find
          .getById('tt8579674', externalIdSource: ExternalId.tvdbId);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });
  });
}
