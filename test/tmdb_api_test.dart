import 'package:flutter_test/flutter_test.dart';

import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB('c25dd0686fd12898c2b186e69e6728fc');
  group('Movie', () {
    test('Details', () async {
      var result = await tmdb.movies
          .getDetails(103, parameters: Parameters(language: 'en-US'));
      assert(result is Map);
      assert(!result.containsKey('status_code'));
      expect(result.containsKey('status_code'), false);
    });

    test('Alternative titles', () async {
      var result = await tmdb.movies.getAlternativeTitle(103);
      assert(result is Map);
      assert(result['status_code'] != 7);
      assert(result['status_code'] != 34);
    });

    test('credits', () async {
      var result = await tmdb.movies.getCredits(103);
      assert(result is Map);
      assert(result['status_code'] != 34);
    });

    test('External Ids', () async {
      Map result = await tmdb.movies.getExternalIds(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Keywords', () async {
      Map result = await tmdb.movies.getKeywords(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Release date', () async {
      Map result = await tmdb.movies.getKeywords(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Videos', () async {
      Map result = await tmdb.movies.getVideos(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Translations', () async {
      Map result = await tmdb.movies.getTranslations(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Recommended', () async {
      Map result = await tmdb.movies.getRecommended(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });

    test('Similar', () async {
      Map result = await tmdb.movies.getSimilar(103);
      assert(result is Map);
      assert(!result.containsKey('status_code'));
    });
  });
}
