import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../lib/keys.dart';

main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Tv', () {
    group('details', () {
      test('with parameters', () async {
        var result = await tmdb.tv
            .getDetails(103, parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getDetails(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Alternative titles', () {
      test('with parameters', () async {
        var result = await tmdb.tv.getAlternativeTitle(103,
            parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getAlternativeTitle(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('credits', () {
      test('without parameters', () async {
        var result = await tmdb.tv.getCredits(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Content rating', () {
      test('without parameters', () async {
        var result = await tmdb.tv.getContentRating(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Eposide group', () {
      test('without parameters', () async {
        var result = await tmdb.tv.getEpisodeGroups(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('External Ids', () {
      test('without parameters', () async {
        var result = await tmdb.tv.getExternalIds(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Alternative titles', () {
      test('without parameters', () async {
        var result = await tmdb.tv.getKeywords(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('recommended', () {
      test('with parameters', () async {
        var result = await tmdb.tv
            .getRecommended(103, parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getRecommended(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Reviews', () {
      test('with parameters', () async {
        var result = await tmdb.tv
            .getReviews(103, parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getReviews(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Screened Theatrically', () {
      test('without parameters', () async {
        var result = await tmdb.tv.getScreenedTheatrically(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Similar', () {
      test('with parameters', () async {
        var result = await tmdb.tv
            .getSimilar(103, parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getSimilar(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Translation', () {
      test('without parameters', () async {
        var result = await tmdb.tv.getTranslations(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Latest', () {
      test('with parameters', () async {
        var result =
            await tmdb.tv.getLatest(parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getLatest();
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Popular', () {
      test('with parameters', () async {
        var result =
            await tmdb.tv.getPouplar(parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getPouplar();
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Top rated', () {
      test('with parameters', () async {
        var result = await tmdb.tv
            .getTopRated(parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getTopRated();
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Airing  today', () {
      test('with parameters', () async {
        var result = await tmdb.tv
            .getAiringToday(parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getAiringToday();
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Get on the Air', () {
      test('with parameters', () async {
        var result = await tmdb.tv
            .getOnTheAir(parameters: Parameters(language: 'en-US'));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.tv.getOnTheAir();
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
