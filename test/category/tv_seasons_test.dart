import 'package:flutter_test/flutter_test.dart';
import '../../lib/keys.dart';
import '../../lib/tmdb_api.dart';

main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Tv seasons', () {
    group('Details', () {
      test('with parameters', () async {
        var result = await tmdb.v3.tvSeasons.getDetails(103, 1,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
        print(result);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.tvSeasons.getDetails(103, 1);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Changes', () {
      test('with parameters', () async {
        var result = await tmdb.v3.tvSeasons.getChanges(302,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.tvSeasons.getChanges(302);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Credits', () {
      test('with parameters', () async {
        var result = await tmdb.v3.tvSeasons.getCredits(103, 1,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.tvSeasons.getCredits(103, 1);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Details', () {
      test('with parameters', () async {
        var result = await tmdb.v3.tvSeasons.getDetails(103, 1,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('without parameters', () async {
        var result = await tmdb.v3.tvSeasons.getDetails(103, 1);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('External ids', () {
      test('without parameters', () async {
        var result = await tmdb.v3.tvSeasons.getExternalId(103, 1);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Images', () {
      test('without parameters', () async {
        var result = await tmdb.v3.tvSeasons.getImages(103, 1);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });

    group('Videos', () {
      test('with parameters', () async {
        var result = await tmdb.v3.tvSeasons.getVideos(103, 1);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
