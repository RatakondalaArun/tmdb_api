import 'package:flutter_test/flutter_test.dart';
import '../../lib/keys.dart';
import '../../lib/tmdb_api.dart';

main() {
  TMDB tmdb = TMDB(Keys.API);
  group('People', () {
    group('Details', () {
      test('with parameters', () async {
        var result = await tmdb.people.getDetails(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.people.getDetails(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Changes', () {
      test('without parameters', () async {
        var result = await tmdb.people.getChanges(
          103,
        );
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('MovieCredits', () {
      test('with parameters', () async {
        var result = await tmdb.people.getMovieCredits(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.people.getMovieCredits(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tv credits', () {
      test('with parameters', () async {
        var result = await tmdb.people.getTvCredits(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.people.getTvCredits(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Combined Credits', () {
      test('with parameters', () async {
        var result = await tmdb.people.getCombinedCredits(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.people.getCombinedCredits(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('External Id', () {
      test('with parameters', () async {
        var result = await tmdb.people.getExternalIds(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.people.getExternalIds(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Images', () {
      test('without parameters', () async {
        var result = await tmdb.people.getImages(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Tagged images', () {
      test('with parameters', () async {
        var result = await tmdb.people.getTaggedImages(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.people.getTaggedImages(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Translations', () {
      test('with parameters', () async {
        var result = await tmdb.people.getTranslations(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.people.getTranslations(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
    group('Latest', () {
      test('without parameters', () async {
        var result = await tmdb.people.getLatest();
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Popular', () {
      test('without parameters', () async {
        var result = await tmdb.people.getPopular();
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
