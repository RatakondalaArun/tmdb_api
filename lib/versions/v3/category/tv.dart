//tv shows
part of tmdb_api;

class Tv {
  final V3 _v3;
  final String _endPoint = 'tv';
  Tv(this._v3) : assert(_v3 != null);

  ///Get the primary TV show details by id.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///`appendToResponse`: Append requests within the same namespace to the response. *pattern: ([\w]+)*
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getDetails(103, language: 'en-US');
  ///```
  Future<Map> getDetails(
    int tvId, {
    String appendToResponse,
    String language = 'en-US',
  }) {
    if (tvId == null || language == null) {
      throw NullValueException('tvId == null || language == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }

    List<String> para = ['language=$language'];
    if (appendToResponse != null) {
      para.add('append_to_response=$appendToResponse');
    }

    return _v3._query('$_endPoint/$tvId',
        method: HttpMethod.GET, optionalQueries: para);
  }

  /// Get the aggregate credits (cast and crew) that have
  /// been added to a TV show.
  ///
  ///
  /// This call differs from the main credits call in that it does not return
  /// the newest season but rather, is a view of all the entire cast & crew
  /// for all episodes belonging to a TV show.
  ///
  Future<Map> getAggregateCredits(String tvId, {String language = 'en-US'}) {
    return _v3._query(
      '$_endPoint/$tvId/aggregate_credits',
      optionalQueries: ['language=$language'],
    );
  }

  ///Returns all of the alternative titles for a TV show.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///`appendToResponse`: Append requests within the same namespace to the response. *pattern: ([\w]+)*
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getAlternaiveTitle(103, language: 'en-US');
  ///```
  Future<Map> getAlternativeTitle(int tvId, {String language = 'en-US'}) {
    if (tvId == null || language == null) {
      throw NullValueException('tvId == null || language == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }

    return _v3._query('$_endPoint/$tvId/alternative_titles',
        method: HttpMethod.GET, optionalQueries: ['language=$language']);
  }

  ///Get the cast and crew for a tv.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getCredits(103);
  ///```
  Future<Map> getCredits(int tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }

    return _v3._query('$_endPoint/$tvId/credits', method: HttpMethod.GET);
  }

  ///Get the list of content ratings (certifications) that have been added to a TV show.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getContentRating(103);
  ///```
  Future<Map> getContentRating(int tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }
    return _v3._query('$_endPoint/$tvId/content_ratings');
  }

  /// Get all of the episode groups that have been created for a TV show
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///`appendToResponse`: Append requests within the same namespace to the response. *pattern: ([\w]+)*
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getEposideGroups(103, language: 'en-US');
  ///```
  Future<Map> getEpisodeGroups(int tvId, {String language = 'en-US'}) {
    if (tvId == null || language == null) {
      throw NullValueException('tvId == null || language == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }

    return _v3._query('$_endPoint/$tvId/episode_groups',
        method: HttpMethod.GET, optionalQueries: ['language=$language']);
  }

  ///Get the external ids for a tv.
  ///
  ///We currently support the following external sources.
  /// - `IMDb ID`
  /// - `Facebook`
  /// - `Instagram`
  /// - `Twitter`
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getExternalIds(103);
  ///```
  Future<Map> getExternalIds(int tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }

    return _v3._query('$_endPoint/$tvId/external_ids', method: HttpMethod.GET);
  }

  ///Get the keywords that have been added to a tv.
  ///
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getKeywords(103);
  ///```
  Future<Map> getKeywords(int tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }

    return _v3._query('$_endPoint/$tvId/keywords', method: HttpMethod.GET);
  }

  /// Get a list of recommended tv show for a tv show.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getRecommendations(103, language: 'en-US');
  ///```
  Future<Map> getRecommendations(int tvId,
      {String language = 'en-US', int page = 1}) {
    if (tvId == null || language == null || page == null) {
      throw NullValueException(
          'tvId == null || language == null || page == null is true');
    }
    if (tvId < 1 || page < 1 || page > 1000) {
      throw InvalidDataException('tvId < 1 || page < 1 || page > 1000 is true');
    }

    return _v3._query('$_endPoint/$tvId/recommendations',
        optionalQueries: ['language=$language', 'page=$page']);
  }

  /// Get the user reviews for a tv.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getReviews(103, language: 'en-US');
  ///```
  Future<Map> getReviews(int tvId, {String language = 'en-US', int page = 1}) {
    if (tvId == null || language == null || page == null) {
      throw NullValueException(
          'tvId == null || language == null || page == null is true');
    }
    if (tvId < 1 || page < 1 || page > 1000) {
      throw InvalidDataException('tvId < 1 || page < 1 || page > 1000 is true');
    }

    return _v3._query('$_endPoint/$tvId/reviews',
        optionalQueries: ['language=$language', 'page=$page']);
  }

  ///Get a list of seasons or episodes
  ///that have been screened in a film festival or theatre.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getScreenedTheatrically(103);
  ///```
  Future<Map> getScreenedTheatrically(int tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }
    return _v3._query('$_endPoint/$tvId/screened_theatrically');
  }

  /// Get a list of similar tv.
  /// This is not the same as the "Recommendation"
  ///
  /// These items are assembled by looking at keywords and genres.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getSimilar(103, language: 'en-US');
  ///```
  Future<Map> getSimilar(int tvId, {String language = 'en-US', int page = 1}) {
    if (tvId == null || language == null || page == null) {
      throw NullValueException(
          'tvId == null || language == null || page == null is true');
    }
    if (tvId < 1 || page < 1 || page > 1000) {
      throw InvalidDataException('tvId < 1 || page < 1 || page > 1000 is true');
    }

    return _v3._query('$_endPoint/$tvId/similar',
        optionalQueries: ['language=$language', 'page=$page']);
  }

  /// Get a list of translations that have been created for a tv show.
  ///
  ///## Parameters
  ///`tvId`: ID of a tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getTranslations(103);
  ///```
  Future<Map> getTranslations(int tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1 is true');
    }

    return _v3._query('$_endPoint/$tvId/translations');
  }

  /// Get the videos that have been added to a TV show.
  ///
  /// ## Parameters
  ///
  /// `tvId`: Id of a tv show.
  ///
  /// ## Implementation
  ///
  /// ```
  /// Map result = await tmdb.v3.tv.getVideos(103);
  /// ```
  ///
  Future<Map> getVideos(String tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    return _v3._query('$_endPoint/$tvId');
  }

  /// Powered by our partnership with JustWatch, you can query
  /// this method to get a list of the availabilities per country by provider.
  /// This is not going to return full deep links, but rather,
  /// it's just enough information to display what's available where.
  /// You can link to the provided TMDb URL to help support TMDb
  /// and provide the actual deep links to the content.
  ///
  /// Please note: In order to use this data you must attribute
  /// the source of the data as JustWatch. If we find any usage not
  /// complying with these terms we will revoke access to the API.
  ///
  /// ## Parameters
  ///
  /// `tvId`: Id of a tv show.
  ///
  /// ## Implementation
  ///
  /// ```
  /// Map result = await tmdb.v3.tv.getWatchProviders(103);
  /// ```
  ///
  Future<Map> getWatchProviders(String tvId) {
    if (tvId == null) {
      throw NullValueException('tvId == null is true');
    }
    return _v3._query('$_endPoint/$tvId/watch/providers');
  }

  ///Get the most newly created tv show.
  ///This is a live response and will continuously change.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getLatest(language: 'en-US');
  ///```
  Future<Map> getLatest({String language = 'en-US'}) {
    if (language == null) {
      throw NullValueException('language==null is true');
    }

    return _v3
        ._query('$_endPoint/latest', optionalQueries: ['language=$language']);
  }

  /// Get a list of the current popular movies on TMDb.
  /// This list updates daily.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getPouplar(language: 'en-US');
  ///```
  Future<Map> getPouplar({String language = 'en-US', int page = 1}) {
    if (language == null || page == null) {
      throw NullValueException(' language == null || page == null is true');
    }
    if (page < 1 || page > 1000) {
      throw InvalidDataException(' page < 1 || page > 1000 is true');
    }

    return _v3._query('$_endPoint/popular',
        optionalQueries: ['language=$language', 'page=$page']);
  }

  /// Get the top rated movies on TMDb.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getTopRated(language: 'en-US');
  ///```
  Future<Map> getTopRated({String language = 'en-US', int page = 1}) {
    if (language == null || page == null) {
      throw NullValueException(' language == null || page == null is true');
    }
    if (page < 1 || page > 1000) {
      throw InvalidDataException(' page < 1 || page > 1000 is true');
    }

    return _v3._query('$_endPoint/top_rated',
        optionalQueries: ['language=$language', 'page=$page']);
  }

  ///Get a list of TV shows that are airing today.
  ///This query is purely day based as we do not
  ///currently support airing times.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getAiringToday(language: 'en-US');
  ///```
  Future<Map> getAiringToday({String language = 'en-US', int page = 1}) {
    if (language == null || page == null) {
      throw NullValueException(' language == null || page == null is true');
    }
    if (page < 1 || page > 1000) {
      throw InvalidDataException(' page < 1 || page > 1000 is true');
    }
    return _v3._query('$_endPoint/airing_today',
        optionalQueries: ['language=$language', 'page=$page']);
  }

  /// Get a list of shows that are currently on the air.
  /// This query looks for any TV show that has an episode
  /// with an air date in the next 7 days.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getOnTheAir(language: 'en-US');
  ///```
  Future<Map> getOnTheAir({String language = 'en-US', int page = 1}) {
    if (language == null || page == null) {
      throw NullValueException(' language == null || page == null is true');
    }
    if (page < 1 || page > 1000) {
      throw InvalidDataException(' page < 1 || page > 1000 is true');
    }
    return _v3._query('$_endPoint/on_the_air',
        optionalQueries: ['language=$language', 'page=$page']);
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
    if (tvId == null || ratingValue == null) {
      throw NullValueException('movieId == null || ratingValue == null');
    }
    if (guestSessionId == null && sessionId == null) {
      throw NullValueException('guestSessionId == null && sessionId == null');
    }
    if (ratingValue < 0.5 || ratingValue > 10.0 || tvId < 1) {
      throw InvalidDataException(
          'ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1');
    }

    List<String> para = [];
    //only one is allowed
    if (sessionId != null) {
      para.add('session_id=$sessionId');
    } else {
      para.add('guest_session_id=$guestSessionId');
    }

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
    if (tvId == null) {
      throw NullValueException('movieId == null || ratingValue == null');
    }
    if (guestSessionId == null && sessionId == null) {
      throw NullValueException('guestSessionId == null && sessionId == null');
    }
    if (tvId < 1) {
      throw InvalidDataException(
          'ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1');
    }

    List<String> para = [];
    //only one is allowed
    if (sessionId != null) {
      para.add('session_id=$sessionId');
    } else {
      para.add('guest_session_id=$guestSessionId');
    }

    return _v3._query('$_endPoint/$tvId/rating',
        method: HttpMethod.DELETE, deleteBody: {}, optionalQueries: para);
  }

  ///Get the images that belong to a tv show.
  ///

  ///
  ///## Parameters
  ///`tvId`: Id of a tv
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`includeImageLanguage`:
  ///Querying images with a language parameter will filter the results.
  ///If you want to include a fallback language (especially useful for backdrops)
  /// you can use the `include_image_language` parameter.
  ///This should be a comma seperated value like so: `include_image_language=en,null.`
  ///
  Future<Map> getImages(int tvId,
      {String language = 'en-US', String includeImageLanguage}) {
    if (tvId == null || language == null) {
      throw NullValueException(
          'tvId == null || tvId == null||language==null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId < 1 is true');
    }

    List<String> para = ['language=$language'];
    if (includeImageLanguage != null) {
      para.add('include_image_language=$includeImageLanguage');
    }

    return _v3._query('$_endPoint/$tvId/images', optionalQueries: para);
  }

  ///Grab the following account states for a session:
  ///
  ///- TV show rating
  ///- If it belongs to your watchlist
  ///- If it belongs to your favourite list
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`guestSessionId`: id of guest session
  ///
  ///`sessionId`: id of session
  ///
  ///only one of this `guestSessionId` or `sessionId` allowed
  ///if both values are provided sessionId will be given priority
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tv.getAccountStatus(34,
  /// sessionId: '5129b38561c99f577bd85cc7f2ff47bb79735902');
  ///```
  ///## Result
  ///```
  ///{
  ///   id: 34,
  ///   favorite: false,
  ///   rated: false,
  ///   watchlist: true
  ///}
  ///```
  ///
  Future<Map> getAccountStatus(int tvId,
      {String sessionId, String guestSessionId}) {
    if (tvId == null) {
      throw NullValueException('tvId==null is true');
    }
    if (tvId < 1) {
      throw InvalidDataException('tvId<1');
    }
    if (sessionId == null && guestSessionId == null) {
      throw NullValueException(
          'sessionId==null && guestSessionId==null is true');
    }
    List<String> para = [];
    //only one is allowed
    if (sessionId != null) {
      para.add('session_id=$sessionId');
    } else {
      para.add('guest_session_id=$guestSessionId');
    }

    return _v3._query('$_endPoint/$tvId/account_states', optionalQueries: para);
  }
}
