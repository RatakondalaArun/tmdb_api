part of tmdb_api;

class Geners extends Category<V3> {
  ///Provides details about movies

  Geners(V3 v) : super(v, 'genre');

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
  /// Map result = await tmdb.v3.geners.getMovieList();
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
  Future<Map> getMovieList({String language = 'en-US'}) {
    return _v._query(
      '$_endPoint/movie/list',
      optionalQueries: ['language=$language'],
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
  /// Map result = await tmdb.v3.geners.getTvList();
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
  Future<Map> getTvlist({String language = 'en-US'}) {
    return _v._query(
      '$_endPoint/tv/list',
      optionalQueries: ['language=$language'],
    );
  }
}
