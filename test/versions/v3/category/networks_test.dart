import 'package:test/test.dart';
import '../../../init_script.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Networks', () {
    test('Details', () async {
      Map result = await tmdb.v3.networks.getDetails(213);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Alternative Names', () async {
      Map result = await tmdb.v3.networks.getAlternativeNames(213);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Images', () async {
      Map result = await tmdb.v3.networks.getImages(213);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
