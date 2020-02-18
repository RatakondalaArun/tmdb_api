part of tmdb_api;

class Changes {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'changes';
  Changes(this._tmdb) : assert(_tmdb != null);

  ///Get a list of all of the movie ids that have been changed in the past 24 hours.
  ///100 items are returned per page.
  ///For doc visit https://developers.themoviedb.org/3/changes/get-movie-change-list
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.changes.getMovieList();
  /// ```
  ///
  Future<Map> getMovieList({Parameters parameters}) {
    return _tmdb._query('movie/$_endPoint', parameters: parameters);
  }

  ///Get a list of all of the TV show ids that have been changed in the past 24 hours.
  ///100 items are returned per page.
  ///For doc visit https://developers.themoviedb.org/3/changes/get-tv-change-list
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.changes.getTvList();
  /// ```
  ///
  Future<Map> getTvList({Parameters parameters}) {
    return _tmdb._query('tv/$_endPoint', parameters: parameters);
  }

  ///Get a list of all of the person ids that have been changed in the past 24 hours.
  ///100 items are returned per page.
  ///For doc visit https://developers.themoviedb.org/3/changes/get-person-change-list
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.changes.getPersonList();
  /// ```
  ///
  Future<Map> getPersonList({Parameters parameters}) {
    return _tmdb._query('person/$_endPoint', parameters: parameters);
  }
}
