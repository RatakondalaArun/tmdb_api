@Skip('Only manual tests are possible')
library;

import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('GuestSession', () {
    test('without prameters', () async {
      final result = await tmdb.v3.guestSession.getRatedMovies('8e97e86d024d2952c4a637351116116e');

      expect(result.containsKey('status_code'), false);
    });

    group('Tv show', () {
      test('without prameters', () async {
        final result = await tmdb.v3.guestSession.getRatedTvShows('8e97e86d024d2952c4a637351116116e');

        expect(result.containsKey('status_code'), false);
      });
    });

    group('tv eposides', () {
      test('without prameters', () async {
        final result = await tmdb.v3.guestSession.getRatedTvEpisodes('8e97e86d024d2952c4a637351116116e');

        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
