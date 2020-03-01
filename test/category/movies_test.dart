import 'package:flutter_test/flutter_test.dart';

import '../../lib/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Movie', () {
    test('Details', () async {
      var result = await tmdb.v3.movies
          .getDetails(103, parameters: Parameters(language: 'en-US'));
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });

    test('Alternative titles', () async {
      var result = await tmdb.v3.movies.getAlternativeTitle(103);
      assert(result is Map);
      assert(result['status_code'] != 7);
      assert(result['status_code'] != 34);
    });

    test('credits', () async {
      var result = await tmdb.v3.movies.getCredits(103);
      assert(result is Map);
      assert(result['status_code'] != 34);
    });

    test('External Ids', () async {
      Map result = await tmdb.v3.movies.getExternalIds(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Keywords', () async {
      Map result = await tmdb.v3.movies.getKeywords(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Release date', () async {
      Map result = await tmdb.v3.movies.getKeywords(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Videos', () async {
      Map result = await tmdb.v3.movies.getVideos(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Translations', () async {
      Map result = await tmdb.v3.movies.getTranslations(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Recommended', () async {
      Map result = await tmdb.v3.movies.getRecommended(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Similar', () async {
      Map result = await tmdb.v3.movies.getSimilar(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    group('User reviews', () {
      test('without parameters', () async {
        Map result = await tmdb.v3.movies.getReviews(103);
        expect(result is Map, true, reason: 'Reviews is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
      test('with parameters', () async {
        Map result = await tmdb.v3.movies.getReviews(103,
            parameters: Parameters(language: 'en-US', page: 3));
        expect(result is Map, true, reason: 'Reviews is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
    });

    group('Lists', () {
      test('with parameters', () async {
        Map result = await tmdb.v3.movies.getReviews(103,
            parameters: Parameters(language: 'en-US', page: 1));
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason:
                'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}');
      });

      test('without parameters', () async {
        Map result = await tmdb.v3.movies.getReviews(103);
        expect(result is Map, true, reason: 'Reviews is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
    });
    group('Latest', () {
      test('with parameters', () async {
        Map result = await tmdb.v3.movies
            .getLatest(parameters: Parameters(language: 'en-US', page: 3));
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason:
                'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}');
      });

      test('without parameters', () async {
        Map result = await tmdb.v3.movies.getLatest();
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
    });

    group('Now Playing', () {
      test('with parameters', () async {
        Map result = await tmdb.v3.movies.getNowPlaying(
            parameters: Parameters(language: 'en-US', page: 3, region: 'IN'));
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason:
                'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}');
      });

      test('without parameters', () async {
        Map result = await tmdb.v3.movies.getNowPlaying();
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
    });

    group('Popular', () {
      test('with parameters', () async {
        Map result = await tmdb.v3.movies.getPouplar(
            parameters: Parameters(language: 'en-US', page: 3, region: 'IN'));
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason:
                'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}');
      });

      test('without parameters', () async {
        Map result = await tmdb.v3.movies.getPouplar();
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
    });

    group('Top rated', () {
      test('with parameters', () async {
        Map result = await tmdb.v3.movies.getTopRated(
            parameters: Parameters(language: 'en-US', page: 3, region: 'IN'));
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason:
                'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}');
      });

      test('without parameters', () async {
        Map result = await tmdb.v3.movies.getTopRated();
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
    });

    group('Upcoming', () {
      test('with parameters', () async {
        Map result = await tmdb.v3.movies.getUpcoming(
            parameters: Parameters(language: 'en-US', page: 3, region: 'IN'));
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason:
                'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}');
      });

      test('without parameters', () async {
        Map result = await tmdb.v3.movies.getUpcoming();
        expect(result is Map, true, reason: 'result is not map');
        expect(result.containsKey('status_code'), false,
            reason: 'error in api');
      });
    });
  });
}
