// ignore_for_file: constant_identifier_names
part of '../../../tmdb_api.dart';

class Images {
  final String _baseUrl = 'https://image.tmdb.org/t/p';

  ///Retruns a URL using which you can fetch image
  ///
  ///
  ///## Parameters
  /// - `imagePath`: imagepath
  /// - `size`: Image size default to `ImageSizes.ORGINAL`
  /// - `ifNullUrl`: to specify which url to return if imagePath is null,
  ///this can be used to specify alternative ImageUrl
  ///## Usage
  ///```
  ///String imageUrl = tmdb.images.getUrl('kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
  ///                                     size: ImageSizes.ORGINAL,
  ///                                     ifNullUrl:
  /// 'https://www.themoviedb.org/assets/1/v4/logos/primary-green-d70eebe18a5eb5b166d5c1ef0796715b8d1a2cbc698f96d311d62f894ae87085.svg'),
  ///```
  ///
  String? getUrl(
    String? imagePath, {
    String size = ImageSizes.ORIGINAL,
    String? ifNullUrl,
  }) {
    if (imagePath == null) return ifNullUrl;

    return '$_baseUrl/$size/$imagePath';
  }
}

class ImageSizes {
  static const String ORIGINAL = 'original';

  //Poster Sizes
  static const String POSTER_SIZE_LOWEST = 'w92';
  static const String POSTER_SIZE_LOW = 'w154';
  static const String POSTER_SIZE_MEDIUM = 'w185';
  static const String POSTER_SIZE_MEDIUMPLUS = 'w342';
  static const String POSTER_SIZE_HIGH = 'w500';
  static const String POSTER_SIZE_HIGHEST = 'w780';

  // Logo Sizes
  static const String LOGO_SIZE_LOWEST = 'w45';
  static const String LOGO_SIZE_LOW = 'w92';
  static const String LOGO_SIZE_MEDIUM = 'w154';
  static const String LOGO_SIZE_MEDIUMPLUS = 'w185';
  static const String LOGO_SIZE_HIGH = 'w300';
  static const String LOGO_SIZE_HIGHEST = 'w500';

  // Backdrop Size
  static const String BACKDROP_SIZE_LOWEST = 'w300';
  static const String BACKDROP_SIZE_MEDIUM = 'w185';
  static const String BACKDROP_SIZE_HIGHEST = 'w780';

  // profile size
  static const String PROFILE_SIZE_LOWEST = 'w45';
  static const String PROFILE_SIZE_MEDIUM = 'w185';
  static const String PROFILE_SIZE_HIGHEST = 'w632';

  // still size
  static const String STILL_SIZE_LOWEST = 'w92';
  static const String STILL_SIZE_MEDIUM = 'w185';
  static const String STILL_SIZE_HIGHEST = 'w300';
}
