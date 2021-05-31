import 'package:test/test.dart';
import '../../../init_script.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Credit', () {
    test('without prameters', () async {
      Map result = await tmdb.v3.credit.getDetails('52542282760ee313280017f9');
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
