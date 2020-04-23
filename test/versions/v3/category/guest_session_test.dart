import 'package:test/test.dart';

import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('GuestSession', () {
    test('without prameters', () async {
      Map result = await tmdb.v3.guestSession
          .getRatedMovies('8e97e86d024d2952c4a637351116116e');
      print(result);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    group('Tv show', () {
      test('without prameters', () async {
        Map result = await tmdb.v3.guestSession
            .getRatedTvShows('8e97e86d024d2952c4a637351116116e');
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('tv eposides', () {
      test('without prameters', () async {
        Map result = await tmdb.v3.guestSession
            .getRatedTvEpisodes('8e97e86d024d2952c4a637351116116e');
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
