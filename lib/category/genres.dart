part of tmdb_api;

class Geners {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'genre';
  Geners(this._tmdb) : assert(_tmdb != null);

  ///Get the list of official genres for movies.
  ///
  ///For doc visit https://developers.themoviedb.org/3/genres/get-movie-list
  ///
  ///*Usage:*
  ///
  ///```
  /// Map result = await tmdb.geners.getMovieList();
  /// ```
  ///
  /// *Result:*
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
  ///
  ///Only supports `language` field
  ///
  Future<Map> getMovieList({Parameters parameters}) {
    // assert(creditId != null && creditId > 0);
    return _tmdb._query('$_endPoint/movie/list', parameters: parameters);
  }

  ///Get the list of official genres for TV shows.
  ///
  ///For doc visit https://developers.themoviedb.org/3/genres/get-tv-list
  ///
  ///*Usage:*
  ///
  ///```
  /// Map result = await tmdb.geners.getTvList();
  /// ```
  ///
  /// *Result:*
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
  ///
  ///Only supports `language` field in parameters
  ///
  Future<Map> getTvlist({Parameters parameters}) {
    // assert(creditId != null && creditId > 0);
    return _tmdb._query('$_endPoint/tv/list', parameters: parameters);
  }
}
