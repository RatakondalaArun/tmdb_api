import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Tv', () {
    group('details', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getDetails(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getDetails(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Alternative titles', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getAlternativeTitle(
          103,
        );
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getAlternativeTitle(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('credits', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getCredits(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Content rating', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getContentRating(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Eposide group', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getEpisodeGroups(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('External Ids', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getExternalIds(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Alternative titles', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getKeywords(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('recommended', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getRecommendations(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getRecommendations(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Reviews', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getReviews(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getReviews(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Screened Theatrically', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getScreenedTheatrically(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Similar', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getSimilar(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getSimilar(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Translation', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getTranslations(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Latest', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getLatest();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getLatest();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Popular', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getPopular();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getPopular();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Top rated', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getTopRated();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getTopRated();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Airing  today', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getAiringToday();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getAiringToday();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Get on the Air', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tv.getOnTheAir();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tv.getOnTheAir();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('>Rate Movie', () {
      test('>check', () async {
        final result = await tmdb.v3.tv.rateTvShow(
          12,
          5,
          sessionId: '2e900a73d597f46bb2abb9663adcabe05d5204f6',
        );
        expect(result is Map, true, reason: 'result is not map');
      });
    });

    group('>Delete tv show Rating', () {
      test('>check', () async {
        final result = await tmdb.v3.tv.deleteRating(
          5,
          sessionId: '2e900a73d597f46bb2abb9663adcabe05d5204f6',
        );
        expect(result is Map, true, reason: 'result is not map');
      });
    });

    group('>account status', () {
      test('>check', () async {
        final result = await tmdb.v3.tv.getAccountStatus(
          34,
          sessionId: '5129b38561c99f577bd85cc7f2ff47bb79735902',
        );
        expect(result is Map, true, reason: 'result is not map');
      });
    });
  });
}
