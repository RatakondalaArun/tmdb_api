import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Tv seasons', () {
    group('Details', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvSeasons.getDetails(
          103,
          1,
          language: 'en-US',
          appendToResponse: 'videos,images',
        );
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tvSeasons.getDetails(103, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Changes', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvSeasons.getChanges(302, page: 2);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tvSeasons.getChanges(302);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Credits', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvSeasons.getCredits(
          103,
          1,
        );
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tvSeasons.getCredits(103, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Details', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvSeasons.getDetails(103, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        final result = await tmdb.v3.tvSeasons.getDetails(103, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('External ids', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tvSeasons.getExternalId(103, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Images', () {
      test('without parameters', () async {
        final result = await tmdb.v3.tvSeasons.getImages(103, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Videos', () {
      test('with parameters', () async {
        final result = await tmdb.v3.tvSeasons.getVideos(103, 1);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
