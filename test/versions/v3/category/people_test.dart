import 'package:flutter_test/flutter_test.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../../../../lib/keys.dart';

main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API, Keys.API_V4));
  group('People', () {
    group('Details', () {
      test('with parameters', () async {
        Map result = await tmdb.v3.people.getDetails(103,
            language: 'en-US', appendToResponse: 'videos,images');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.people.getDetails(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Changes', () {
      test('without parameters', () async {
        var result = await tmdb.v3.people.getChanges(
          103,
        );
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('MovieCredits', () {
      test('with parameters', () async {
        var result =
            await tmdb.v3.people.getMovieCredits(103, language: 'en-US');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.people.getMovieCredits(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv credits', () {
      test('with parameters', () async {
        var result = await tmdb.v3.people.getTvCredits(103, language: 'en-US');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.people.getTvCredits(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Combined Credits', () {
      test('with parameters', () async {
        var result =
            await tmdb.v3.people.getCombinedCredits(103, language: 'en-US');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.people.getCombinedCredits(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('External Id', () {
      test('with parameters', () async {
        var result =
            await tmdb.v3.people.getExternalIds(103, language: 'en-US');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.people.getExternalIds(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Images', () {
      test('without parameters', () async {
        var result = await tmdb.v3.people.getImages(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tagged images', () {
      test('with parameters', () async {
        var result =
            await tmdb.v3.people.getTaggedImages(103, language: 'en-US');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.people.getTaggedImages(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Translations', () {
      test('with parameters', () async {
        var result =
            await tmdb.v3.people.getTranslations(103, language: 'en-US');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.people.getTranslations(103);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Latest', () {
      test('without parameters', () async {
        var result = await tmdb.v3.people.getLatest();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Popular', () {
      test('without parameters', () async {
        var result = await tmdb.v3.people.getPopular();
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
