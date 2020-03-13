import 'package:flutter_test/flutter_test.dart';

import '../../lib/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
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
