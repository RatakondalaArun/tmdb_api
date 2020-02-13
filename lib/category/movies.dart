part of tmdb_api;

class Movies {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'movie';
  Movies(this._tmdb);

  ///Returns Movie Details of a given id;
  Future<Map> getDetails(int movieId, {Parameters parameters}) {
    assert(movieId != null);
    //todo:implement page and language
    return _tmdb._query('$_endPoint/$movieId',
        method: HttpMethod.GET, parameters: parameters);
  }

  Future<Map> getAlternativeTitle(int movieId, {String country}) {
    assert(movieId != null);
    return _tmdb._query('$_endPoint/$movieId/alternative_titles',
        method: HttpMethod.GET);
  }

  ///Get the cast and crew for a movie.
  Future<Map> getCredits(int movieId) {
    assert(movieId != null);
    return _tmdb._query('$_endPoint/$movieId/credits', method: HttpMethod.GET);
  }

  ///Get the external ids for a movie.
  ///
  ///We currently support the following external sources.
  /// - `IMDb ID`
  /// - `Facebook`
  /// - `Instagram`
  /// - `Twitter`
  ///
  Future<Map> getExternalIds(int movieId) {
    assert(movieId != null);
    return _tmdb._query('$_endPoint/$movieId/external_ids',
        method: HttpMethod.GET);
  }

  ///Get the keywords that have been added to a movie.
  ///
  ///
  Future<Map> getKeywords(int movieId) {
    assert(movieId != null);
    return _tmdb._query('$_endPoint/$movieId/keywords', method: HttpMethod.GET);
  }

  ///Get the release date along with the certification for a movie.
  ///
  ///Release dates support different types:
  ///
  /// - `Premiere`
  /// - `Theatrical (limited)`
  /// - `Theatrical`
  /// - `Digital`
  /// - `Physical`
  /// - `TV`
  Future<Map> getReleaseDates(int movieId) {
    return _tmdb._query('$_endPoint/$movieId/release_dates',
        method: HttpMethod.GET);
  }

  ///Get the videos that have been added to a movie.
  Future<Map> getVideos(int movieId) {
    assert(movieId != null); //to capture null values
    return _tmdb._query('$_endPoint/$movieId/videos');
  }

  /// Get a list of translations that have been created for a movie.
  Future<Map> getTranslations(int movieId) {
    assert(movieId != null);
    return _tmdb._query('$_endPoint/$movieId/translations');
  }

  /// Get a list of recommended movies for a movie.
  Future<Map> getRecommended(int movieId,
      {String language, int page = 1}) async {
    assert(movieId != null);
    //todo:implement page and language
    return _tmdb._query('$_endPoint/$movieId/recommendations');
  }

  /// Get a list of similar movies.
  /// This is not the same as the "Recommendation"
  ///
  /// These items are assembled by looking at keywords and genres.
  Future<Map> getSimilar(int movieId, {String language, int page = 1}) {
    assert(movieId != null);
    //todo:implement page and language
    return _tmdb._query('$_endPoint/$movieId/similar');
  }
}
