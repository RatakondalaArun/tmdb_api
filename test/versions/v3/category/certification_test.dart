import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Certification', () {
    test('movie', () async {
      final result = await tmdb.v3.certification.getMovie();
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('TV', () async {
      final result = await tmdb.v3.certification.getTv();
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
  });
}
