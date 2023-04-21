import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Credit', () {
    test('without prameters', () async {
      final result = await tmdb.v3.find.getById('tt8579674');
      expect(result.containsKey('status_code'), false);
    });
    test('parameter link test', () async {
      final result = await tmdb.v3.find.getById('tt8579674', externalIdSource: ExternalId.tvdbId);
      expect(result.containsKey('status_code'), false);
    });
  });
}
