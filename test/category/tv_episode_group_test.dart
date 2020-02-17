import 'package:flutter_test/flutter_test.dart';
import '../../lib/keys.dart';
import '../../lib/tmdb_api.dart';

main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Tv Episode Group', () {
    group('Details', () {
      test('with out parameters', () async {
        var result = await tmdb.tvEpisodeGroup.getDetails(103);
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
      test('with parameters', () async {
        var result = await tmdb.tvEpisodeGroup.getDetails(103,
            parameters:
                Parameters(language: 'en-US', append: ['videos,images']));
        assert(result is Map);
        expect(result.containsKey('status_code'), false);
      });
    });
  });
}
