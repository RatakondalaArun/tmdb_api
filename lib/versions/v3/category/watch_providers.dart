//tv shows
part of '../../../tmdb_api.dart';

/// Watch Providers
class WatchProviders extends Category<V3> {
  WatchProviders(V3 v) : super(v, 'watch/providers');

  /// Get the list of the countries we have watch provider (OTT/streaming) data for.
  ///
  /// ## Parameters
  ///
  /// `language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///
  /// ## Usage
  ///
  /// ```dart
  /// Map result = await tmdb.v3.watchProviders.getAvaliableRegion(language: 'en-US');
  /// ```
  ///
  Future<Map> getAvaliableRegion({String? language}) async {
    final para = <String>['language=${language ?? _v._tmdb.defaultLanguage}'];
    return _v._query('$_endPoint/regions', optionalQueries: para);
  }

  /// Get the list of streaming providers we have for movies.
  ///
  /// Returns a list of the watch provider (OTT/streaming) data we have available for movies.
  /// You can specify a [watchRegion] param if you want to further filter the list by country.
  ///
  /// ## Usage
  ///
  /// ```dart
  /// Map result = await tmdb.v3.watchProviders.getMovieProviders(language: 'en-US');
  /// ```
  Future<Map> getMovieProviders({String? language, String? watchRegion}) async {
    final params = {
      'language': language ?? _v._tmdb.defaultLanguage,
      'watch_region': watchRegion,
    };

    return _v._query(
      '$_endPoint/movie',
      optionalQueries:
          params.entries.where((element) => element.value != null).map((e) => '${e.key}=${e.value}').toList(),
    );
  }

  /// Get the list of streaming providers we have for TV shows.
  ///
  /// Returns a list of the watch provider (OTT/streaming) data we have available for TV shows.
  /// You can specify a [watchRegion] param if you want to further filter the list by country.
  ///
  /// ## Usage
  ///
  /// ```dart
  /// Map result = await tmdb.v3.watchProviders.getTVProviders(language: 'en-US');
  /// ```
  Future<Map> getTVProviders({String? language, String? watchRegion}) async {
    final params = {
      'language': language ?? _v._tmdb.defaultLanguage,
      'watch_region': watchRegion,
    };

    return _v._query(
      '$_endPoint/tv',
      optionalQueries:
          params.entries.where((element) => element.value != null).map((e) => '${e.key}=${e.value}').toList(),
    );
  }
}
