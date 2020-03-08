//tv shows
part of tmdb_api;

class Tv {
  final V3 _v3;
  final String _endPoint = 'tv';
  Tv(this._v3) : assert(_v3 != null);

  ///Get the primary TV show details by id.
  ///
  /// Supports append_to_response
  Future<Map> getDetails(int tvId, {Parameters parameters}) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId',
        method: HttpMethod.GET, parameters: parameters);
  }

  ///Returns all of the alternative titles for a TV show.
  Future<Map> getAlternativeTitle(int tvId, {Parameters parameters}) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/alternative_titles',
        method: HttpMethod.GET, parameters: parameters);
  }

  ///Get the cast and crew for a tv.
  Future<Map> getCredits(int tvId) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/credits', method: HttpMethod.GET);
  }

  ///Get the list of content ratings (certifications) that have been added to a TV show.
  Future<Map> getContentRating(int tvId) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/content_ratings');
  }

  /// Get all of the episode groups that have been created for a TV show
  Future<Map> getEpisodeGroups(int tvId, {Parameters parameters}) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/episode_groups',
        method: HttpMethod.GET, parameters: parameters);
  }

  ///Get the external ids for a tv.
  ///
  ///We currently support the following external sources.
  /// - `IMDb ID`
  /// - `Facebook`
  /// - `Instagram`
  /// - `Twitter`
  ///
  Future<Map> getExternalIds(int tvId) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/external_ids', method: HttpMethod.GET);
  }

  ///Get the keywords that have been added to a tv.
  ///
  Future<Map> getKeywords(int tvId) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/keywords', method: HttpMethod.GET);
  }

  /// Get a list of recommended tv show for a tv show.
  Future<Map> getRecommended(int tvId, {Parameters parameters}) async {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/recommendations',
        parameters: parameters);
  }

  /// Get the user reviews for a tv.
  Future<Map> getReviews(int tvId, {Parameters parameters}) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/reviews', parameters: parameters);
  }

  ///Get a list of seasons or episodes
  ///that have been screened in a film festival or theatre.
  Future<Map> getScreenedTheatrically(int tvId) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/screened_theatrically');
  }

  /// Get a list of similar tv.
  /// This is not the same as the "Recommendation"
  ///
  /// These items are assembled by looking at keywords and genres.
  Future<Map> getSimilar(int tvId, {Parameters parameters}) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/similar', parameters: parameters);
  }

  /// Get a list of translations that have been created for a tv show.
  Future<Map> getTranslations(int tvId) {
    assert(tvId != null);
    return _v3._query('$_endPoint/$tvId/translations');
  }

  ///Get the most newly created tv show.
  ///This is a live response and will continuously change.
  Future<Map> getLatest({Parameters parameters}) {
    return _v3._query('$_endPoint/latest', parameters: parameters);
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

  ///Get a list of TV shows that are airing today.
  ///This query is purely day based as we do not
  ///currently support airing times.
  Future<Map> getAiringToday({Parameters parameters}) {
    return _v3._query('$_endPoint/airing_today', parameters: parameters);
  }

  /// Get a list of shows that are currently on the air.
  /// This query looks for any TV show that has an episode
  /// with an air date in the next 7 days.
  Future<Map> getOnTheAir({Parameters parameters}) {
    return _v3._query('$_endPoint/on_the_air');
  }

  ///Rate a TV show.
  ///
  ///A valid session or guest session ID is required
  ///
  ///## Parameters
  ///`tvId`: id of the tv
  ///
  ///`ratingValue`: rating value should be minimum 0.5 and maximum 10
  ///
  ///`guestSessionId`: id of guest session
  ///
  ///`sessionId`: id of session
  ///
  ///only one of this `guestSessionId` or `sessionId` allowed.
  ///If both values are provided sessionId will be given priority
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.rateTvShow(12, 5,
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
  Future<Map> rateTvShow(int tvId, double ratingValue,
      {String guestSessionId, String sessionId}) {
    if (tvId == null || ratingValue == null)
      throw NullValueException('movieId == null || ratingValue == null');
    if (guestSessionId == null && sessionId == null)
      throw NullValueException('guestSessionId == null && sessionId == null');
    if (ratingValue < 0.5 || ratingValue > 10.0 || tvId < 1)
      throw InvalidDataException(
          'ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1');

    List<String> para = [];
    //only one is allowed
    if (sessionId != null)
      para.add('session_id=$sessionId');
    else
      para.add('guest_session_id=$guestSessionId');

    return _v3._query('$_endPoint/$tvId/rating',
        method: HttpMethod.POST,
        postBody: {'value': '$ratingValue'},
        optionalQueries: para);
  }

  ///Remove your rating for a tv show.
  ///
  ///A valid session or guest session ID is required.
  ///## Parameters
  ///`tvId`: id of the movie
  ///
  ///`guestSessionId`: id of guest session
  ///
  ///`sessionId`: id of session
  ///
  ///only one of this `guestSessionId` or `sessionId` allowed
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.deleteRating(5,
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
  Future<Map> deleteRating(int tvId,
      {String guestSessionId, String sessionId}) {
    if (tvId == null)
      throw NullValueException('movieId == null || ratingValue == null');
    if (guestSessionId == null && sessionId == null)
      throw NullValueException('guestSessionId == null && sessionId == null');
    if (tvId < 1)
      throw InvalidDataException(
          'ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1');

    List<String> para = [];
    //only one is allowed
    if (sessionId != null)
      para.add('session_id=$sessionId');
    else
      para.add('guest_session_id=$guestSessionId');

    return _v3._query('$_endPoint/$tvId/rating',
        method: HttpMethod.DELETE, postBody: {}, optionalQueries: para);
  }
}
