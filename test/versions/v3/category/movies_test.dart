import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Movie', () {
    test('Details', () async {
      final result = await tmdb.v3.movies.getDetails(103, language: 'en-IN');
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('Alternative titles', () async {
      final result = await tmdb.v3.movies.getAlternativeTitle(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('credits', () async {
      final result = await tmdb.v3.movies.getCredits(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('External Ids', () async {
      final result = await tmdb.v3.movies.getExternalIds(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('Keywords', () async {
      final result = await tmdb.v3.movies.getKeywords(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('Release date', () async {
      final result = await tmdb.v3.movies.getKeywords(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('Videos', () async {
      final result = await tmdb.v3.movies.getVideos(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('Translations', () async {
      final result = await tmdb.v3.movies.getTranslations(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('Recommended', () async {
      final result = await tmdb.v3.movies.getRecommended(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    test('Similar', () async {
      final result = await tmdb.v3.movies.getSimilar(103);
      expect(result is Map, true);
      expect(result.containsKey('status_code'), false);
    });

    group('User reviews', () {
      test('without parameters', () async {
        final result = await tmdb.v3.movies.getReviews(103);
        expect(result is Map, true, reason: 'Reviews is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api',
        );
      });
      test('with parameters', () async {
        final result = await tmdb.v3.movies.getReviews(
          103,
          language: 'en-IN',
          page: 3,
        );
        expect(result is Map, true, reason: 'Reviews is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api',
        );
      });
    });

    group('Lists', () {
      test('with parameters', () async {
        final result = await tmdb.v3.movies.getReviews(
          103,
          language: 'en-IN',
          page: 2,
        );
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason:
              'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}',
        );
      });

      test('without parameters', () async {
        final result = await tmdb.v3.movies.getReviews(103);
        expect(result is Map, true, reason: 'Reviews is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api',
        );
      });
    });
    group('Latest', () {
      test('with parameters', () async {
        final result = await tmdb.v3.movies.getLatest(language: 'en-IN');
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason:
              'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}',
        );
      });

      test('without parameters', () async {
        final result = await tmdb.v3.movies.getLatest();
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api',
        );
      });
    });

    group('Now Playing', () {
      test('with parameters', () async {
        final result = await tmdb.v3.movies
            .getNowPlaying(language: 'en-IN', page: 3, region: 'IN');
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason:
              'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}',
        );
      });

      test('without parameters', () async {
        final result = await tmdb.v3.movies.getNowPlaying();
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api',
        );
      });
    });

    group('Popular', () {
      test('with parameters', () async {
        final result = await tmdb.v3.movies
            .getPouplar(language: 'en-IN', page: 3, region: 'IN');
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason:
              'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}',
        );
      });

      test('without parameters', () async {
        final result = await tmdb.v3.movies.getPouplar();
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api,',
        );
      });
    });

    group('Top rated', () {
      test('with parameters', () async {
        final result = await tmdb.v3.movies
            .getTopRated(language: 'en-IN', page: 3, region: 'IN');
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason:
              'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}',
        );
      });

      test('without parameters', () async {
        final result = await tmdb.v3.movies.getTopRated();
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api',
        );
      });
    });

    group('Upcoming', () {
      test('with parameters', () async {
        final result = await tmdb.v3.movies
            .getUpcoming(language: 'en-IN', page: 3, region: 'IN');
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason:
              'error in api, contains status_code= ${result['status_code']}, status_message= ${result['status_message']}',
        );
      });

      test('without parameters', () async {
        final result = await tmdb.v3.movies.getUpcoming();
        expect(result is Map, true, reason: 'result is not map');
        expect(
          result.containsKey('status_code'),
          false,
          reason: 'error in api',
        );
      });
    });

    group('>Rate Movie', () {
      test('>check', () async {
        final result = await tmdb.v3.movies.rateMovie(
          12,
          5,
          sessionId: '2e900a73d597f46bb2abb9663adcabe05d5204f6',
        );
        expect(result is Map, true, reason: 'result is not map');
      });
    });

    group('>Delete Movie Rating', () {
      test('>check', () async {
        final result = await tmdb.v3.movies.deleteRating(
          5,
          sessionId: '2e900a73d597f46bb2abb9663adcabe05d5204f6',
        );
        expect(result is Map, true, reason: 'result is not map');
      });
    });
    group('>Image', () {
      test('>check', () async {
        final result = await tmdb.v3.movies.getImages(103);
        expect(result is Map, true, reason: 'result is not map');
      });
    });

    group('>account status', () {
      test('>check', () async {
        final result = await tmdb.v3.movies.getAccountStatus(
          12,
          sessionId: '5129b38561c99f577bd85cc7f2ff47bb79735902',
        );
        expect(result is Map, true, reason: 'result is not map');
      });
    });
  });
}
