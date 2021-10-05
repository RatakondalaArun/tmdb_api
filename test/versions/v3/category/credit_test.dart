import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Credit', () {
    test('without prameters', () async {
      final result =
          await tmdb.v3.credit.getDetails('52542282760ee313280017f9');
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
