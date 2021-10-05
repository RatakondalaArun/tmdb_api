import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Tv episodes', () {
    group('Details', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getDetails(
          103,
          1,
          1,
          language: 'en-IN',
          appendToResponse: 'videos,images',
        );
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getDetails(103, 1, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Changes', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getChanges(302, page: 2);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getChanges(302);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Credits', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getCredits(103, 1, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getCredits(103, 1, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('External ids', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getExternalId(103, 1, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Images', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getImages(103, 1, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Videos', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getVideos(103, 1, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Translations', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tvEpisodes.getTranslation(103, 1, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
