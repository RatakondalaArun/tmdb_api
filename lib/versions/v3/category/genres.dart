part of tmdb_api;

class Genres extends Category<V3> {
  ///Provides details about gemres
  Genres(V3 v) : super(v, 'genre');

  ///Get the list of official genres for movies.
  ///
  ///For doc [visit](https://developers.themoviedb.org/3/genres/get-movie-list)
  ///
  ///## Parameters
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2, pattern: ([a-z]{2})-([A-Z]{2}), default: en-US*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.genres.getMovieList();
  /// ```
  ///
  /// ## Result
  ///
  ///```
  ///{
  ///   "genres": [
  ///     {
  ///       "id": 28,
  ///       "name": "Action"
  ///     }
  ///   ]
  /// }
  ///```
  Future<Map> getMovieList({String? language}) {
    return _v._query(
      '$_endPoint/movie/list',
      optionalQueries: ['language=${language ?? _v._tmdb.defaultLanguage}'],
    );
  }

  ///Get the list of official genres for TV shows.
  ///
  ///For doc [visit](https://developers.themoviedb.org/3/genres/get-tv-list)
  ///
  ///## Parameters
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2, pattern: ([a-z]{2})-([A-Z]{2}), default: en-US*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.genres.getTvList();
  /// ```
  ///
  ///## Result
  ///
  ///```
  ///{
  ///   "genres": [
  ///     {
  ///       "id": 10759,
  ///       "name": "Action & Adventure"
  ///     }
  ///   ]
  /// }
  ///```
  Future<Map> getTvlist({String? language}) {
    return _v._query(
      '$_endPoint/tv/list',
      optionalQueries: ['language=${language ?? _v._tmdb.defaultLanguage}'],
    );
  }
}

class Geners extends Genres {
  Geners(V3 v) : super(v);
}
