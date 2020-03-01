import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Networks', () {
    test('Details', () async {
      Map result = await tmdb.networks.getDetails(213);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Alternative Names', () async {
      Map result = await tmdb.networks.getAlternativeNames(213);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Images', () async {
      Map result = await tmdb.networks.getImages(213);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });
    test('Null values', () async {
      //for details
      try {
        await tmdb.networks.getDetails(null);
      } catch (e) {
        expect(e is NullValueException, true);
        print(e.toString());
      }
      //for Alternative names
      try {
        await tmdb.networks.getAlternativeNames(null);
      } catch (e) {
        expect(e is NullValueException, true);
        print(e.toString());
      }
      //for images
      try {
        await tmdb.networks.getImages(null);
      } catch (e) {
        expect(e is NullValueException, true);
        print(e.toString());
      }
    });
  });
}
