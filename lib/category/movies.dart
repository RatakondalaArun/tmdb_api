part of tmdb_api;

class Movies {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'movie';
  Movies(this._v3) : assert(_v3 != null);

  ///Returns Movie Details of a given id;
  Future<Map> getDetails(int movieId, {Parameters parameters}) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId',
        method: HttpMethod.GET, parameters: parameters);
  }

  Future<Map> getAlternativeTitle(int movieId, {Parameters parameters}) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/alternative_titles',
        method: HttpMethod.GET, parameters: parameters);
  }

  ///Get the cast and crew for a movie.
  Future<Map> getCredits(int movieId) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/credits', method: HttpMethod.GET);
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
    return _v3._query('$_endPoint/$movieId/external_ids',
        method: HttpMethod.GET);
  }

  ///Get the keywords that have been added to a movie.
  ///
  ///
  Future<Map> getKeywords(int movieId) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/keywords', method: HttpMethod.GET);
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
    return _v3._query('$_endPoint/$movieId/release_dates',
        method: HttpMethod.GET);
  }

  ///Get the videos that have been added to a movie.
  Future<Map> getVideos(int movieId) {
    assert(movieId != null); //to capture null values
    return _v3._query('$_endPoint/$movieId/videos');
  }

  /// Get a list of translations that have been created for a movie.
  Future<Map> getTranslations(int movieId) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/translations');
  }

  /// Get a list of recommended movies for a movie.
  Future<Map> getRecommended(int movieId, {Parameters parameters}) async {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/recommendations',
        parameters: parameters);
  }

  /// Get a list of similar movies.
  /// This is not the same as the "Recommendation"
  ///
  /// These items are assembled by looking at keywords and genres.
  Future<Map> getSimilar(int movieId, {Parameters parameters}) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/similar', parameters: parameters);
  }

  /// Get the user reviews for a movie.
  Future<Map> getReviews(int movieId, {Parameters parameters}) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/reviews', parameters: parameters);
  }

  /// Get a list of lists that this movie belongs to.
  ///
  /// For more details refer to https://developers.themoviedb.org/3/movies/get-movie-lists
  Future<Map> getLists(int movieId, {Parameters parameters}) {
    assert(movieId != null);
    return _v3._query('$_endPoint/$movieId/lists', parameters: parameters);
  }

  ///Get the most newly created movie.
  ///This is a live response and will continuously change.
  Future<Map> getLatest({Parameters parameters}) {
    return _v3._query('$_endPoint/latest', parameters: parameters);
  }

  ///Get a list of movies in theatres.
  ///This is a release type query that looks
  ///for all movies that have a release type
  ///of 2 or 3 within the specified date range.
  ///
  ///You can optionally specify a [region] prameter using [parameter]
  ///which will narrow the search to only look for theatrical
  ///release dates within the specified country.
  Future<Map> getNowPlaying({Parameters parameters}) {
    return _v3._query('$_endPoint/now_playing', parameters: parameters);
  }

  /// Get a list of the current popular movies on TMDb.
  /// This list updates daily.
  Future<Map> getPouplar({Parameters parameters}) {
    return _v3._query('$_endPoint/popular', parameters: parameters);
  }

  /// Get the top rated movies on TMDb.
  Future<Map> getTopRated({Parameters parameters}) {
    return _v3._query('$_endPoint/top_rated', parameters: parameters);
  }

  ///Get a list of upcoming movies in theatres.
  ///This is a release type query that looks for all movies
  ///that have a release type of 2 or 3 within the specified date range.
  ///
  ///You can optionally specify a [region] parameter
  ///which will narrow the search to only look for
  ///theatrical release dates within the specified country.
  Future<Map> getUpcoming({Parameters parameters}) {
    return _v3._query('$_endPoint/upcoming', parameters: parameters);
  }

  ///Rate a movie.
  ///
  ///A valid session or guest session ID is required.
  ///You can read more about how this works
  ///[here](https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id)
  ///
  ///## Parameters
  ///`movieId`: id of the movie
  ///
  ///`ratingValue`: rating value should be minimum 0.5 and maximum 10
  ///
  ///`guestSessionId`: id of guest session
  ///
  ///`sessionId`: id of session
  ///
  ///only one of this `guestSessionId` or `sessionId` allowed
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.movies.rateMovie(12, 5,
  /// sessionId: '2e900a73d597f46bb2abb9663adcabe05d5204f6');
  ///```
  ///
  ///## Result
  ///```
  ///{
  /// status_code: 1,
  /// status_message: Success.
  ///}
  ///```
  Future<Map> rateMovie(int movieId, double ratingValue,
      {String guestSessionId, String sessionId}) {
    if (movieId == null || ratingValue == null)
      throw NullValueException('movieId == null || ratingValue == null');
    if (guestSessionId == null && sessionId == null)
      throw NullValueException('guestSessionId == null && sessionId == null');
    if (ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1)
      throw InvalidDataException(
          'ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1');

    List<String> para = [];
    //only one is allowed
    if (sessionId != null)
      para.add('session_id=$sessionId');
    else
      para.add('guest_session_id=$guestSessionId');

    return _v3._query('$_endPoint/$movieId/rating',
        method: HttpMethod.POST,
        postBody: {'value': '$ratingValue'},
        optionalQueries: para);
  }

  ///Remove your rating for a movie.
  ///
  ///A valid session or guest session ID is required.
  ///## Parameters
  ///`movieId`: id of the movie
  ///
  ///`guestSessionId`: id of guest session
  ///
  ///`sessionId`: id of session
  ///
  ///only one of this `guestSessionId` or `sessionId` allowed
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.movies.deleteRating(5,
  /// sessionId: '2e900a73d597f46bb2abb9663adcabe05d5204f6');
  ///```
  ///
  ///## Result
  ///```
  ///{
  /// status_code: 13,
  /// status_message: The item/record was deleted successfully.
  ///}
  ///```
  Future<Map> deleteRating(int movieId,
      {String guestSessionId, String sessionId}) {
    if (movieId == null)
      throw NullValueException('movieId == null || ratingValue == null');
    if (guestSessionId == null && sessionId == null)
      throw NullValueException('guestSessionId == null && sessionId == null');
    if (movieId < 1)
      throw InvalidDataException(
          'ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1');

    List<String> para = [];
    //only one is allowed
    if (sessionId != null)
      para.add('session_id=$sessionId');
    else
      para.add('guest_session_id=$guestSessionId');

    return _v3._query('$_endPoint/$movieId/rating',
        method: HttpMethod.DELETE, postBody: {}, optionalQueries: para);
  }
}
