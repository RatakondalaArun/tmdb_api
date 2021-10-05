import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Images', () {
    test('with prameters', () async {
      expect(
          tmdb.images.getUrl('kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
              size: ImageSizes.POSTER_SIZE_HIGH),
          'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg');
    });
    test('ifNullUrl', () {
      expect(
          tmdb.images.getUrl(null,
              size: ImageSizes.POSTER_SIZE_HIGH,
              ifNullUrl:
                  'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg'),
          'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg');
    });
    test('return null', () {
      expect(tmdb.images.getUrl(null, size: ImageSizes.POSTER_SIZE_HIGH), null);
    });
  });
}
