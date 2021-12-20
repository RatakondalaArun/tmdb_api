part of tmdb_api;

class Movies extends Category<V3> {
  ///Provides details about movies
  // final V3 _v;
  // final String _endPoint = 'movie';
  Movies(V3 v) : super(v, 'movie');

  ///Get the primary information about a movie.
  ///
  ///
  ///## Parameters
  ///`appendToResponse`:Append requests within the same namespace to the response. *pattern: ([\w]+)*
  ///
  ///## Implementation
  ///```
  /// Map result = await tmdb.v3.movies.getDetails(103, language: 'en-US');
  ///```
  Future<Map> getDetails(
    int movieId, {
    String language = 'en-US',
    String? appendToResponse,
  }) {
    return _v._query(
      '$_endPoint/$movieId',
      optionalQueries: [
        'language=$language',
        'append_to_response=$appendToResponse'
      ],
    );
  }

  ///Get all of the alternative titles for a movie.
  ///
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`country`: country in ISO 3166-1. *default:'US'*.
  ///Get the list of countries (ISO 3166-1 tags) used throughout TMDb
  ///from [here](https://developers.themoviedb.org/3/configuration/get-countries).
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getAlternativeTitle(103);
  ///```
  ///
  Future<Map> getAlternativeTitle(int movieId, {String country = 'US'}) {
    return _v._query(
      '$_endPoint/$movieId/alternative_titles',
      optionalQueries: ['country=$country'],
    );
  }

  ///Get the cast and crew for a movie.
  ///
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getCredits(103);
  ///```
  ///
  Future<Map> getCredits(int movieId) {
    return _v._query(
      '$_endPoint/$movieId/credits',
    );
  }

  ///Get the external ids for a movie.
  ///
  ///We currently support the following external sources.
  /// - `IMDb ID`
  /// - `Facebook`
  /// - `Instagram`
  /// - `Twitter`
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getExternalIds(103);
  ///```
  ///
  Future<Map> getExternalIds(int movieId) {
    return _v._query(
      '$_endPoint/$movieId/external_ids',
    );
  }

  ///Get the keywords that have been added to a movie.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getKeyWords(103);
  ///```
  ///
  Future<Map> getKeywords(int movieId) {
    return _v._query(
      '$_endPoint/$movieId/keywords',
    );
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
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getReleaseDates(103);
  ///```
  ///
  Future<Map> getReleaseDates(int movieId) {
    return _v._query(
      '$_endPoint/$movieId/release_dates',
    );
  }

  ///Get the videos that have been added to a movie.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getVideos(103);
  ///```
  ///
  Future<Map> getVideos(int movieId) {
    return _v._query('$_endPoint/$movieId/videos');
  }

  /// Get a list of translations that have been created for a movie.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getTranslations(103);
  ///```
  ///
  Future<Map> getTranslations(int movieId) {
    return _v._query('$_endPoint/$movieId/translations');
  }

  /// Get a list of recommended movies for a movie.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getRecommended(103);
  ///```
  ///
  Future<Map> getRecommended(
    int movieId, {
    String language = 'en-US',
    int page = 1,
  }) async {
    if (movieId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
    }

    return _v._query(
      '$_endPoint/$movieId/recommendations',
      optionalQueries: ['language=$language', 'page=$page'],
    );
  }

  /// Get a list of similar movies.
  /// This is not the same as the "Recommendation"
  ///
  /// These items are assembled by looking at keywords and genres.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getRecommended(103);
  ///```
  ///
  Future<Map> getSimilar(
    int movieId, {
    String language = 'en-US',
    int page = 1,
  }) {
    if (movieId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
    }

    return _v._query(
      '$_endPoint/$movieId/similar',
      optionalQueries: ['language=$language', 'page=$page'],
    );
  }

  /// Get the user reviews for a movie.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getReviews(103);
  ///```
  ///
  Future<Map> getReviews(
    int movieId, {
    String language = 'en-US',
    int page = 1,
  }) {
    if (movieId < 1 || page < 1 || page > 1000) {
      {
        throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
      }
    }

    return _v._query(
      '$_endPoint/$movieId/reviews',
      optionalQueries: ['language=$language', 'page=$page'],
    );
  }

  /// Get a list of lists that this movie belongs to.
  ///
  /// For more details [refer to](https://developers.themoviedb.org/3/movies/get-movie-lists).
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getLists(103);
  ///```
  ///
  Future<Map> getLists(
    int movieId, {
    String language = 'en-US',
    int page = 1,
  }) {
    if (movieId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
    }

    return _v._query(
      '$_endPoint/$movieId/lists',
      optionalQueries: ['language=$language', 'page=$page'],
    );
  }

  ///Get the most newly created movie.
  ///This is a live response and will continuously change.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getLatest(103);
  ///```
  ///
  Future<Map> getLatest({String language = 'en-US'}) {
    return _v._query(
      '$_endPoint/latest',
      optionalQueries: ['language=$language'],
    );
  }

  ///Get a list of movies in theatres.
  ///This is a release type query that looks
  ///for all movies that have a release type
  ///of 2 or 3 within the specified date range.
  ///
  ///You can optionally specify a [region] prameter using [parameter]
  ///which will narrow the search to only look for theatrical
  ///release dates within the specified country.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///`region`:Specify a ISO 3166-1 code to filter release dates. Must be uppercase. *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getNowPlaying();
  ///```
  ///
  Future<Map> getNowPlaying({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) {
    if (page < 1 || page > 1000) {
      throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
    }

    final para = <String>['language=$language', 'page=$page'];
    if (region != null) {
      para.add('region=$region');
    }

    return _v._query('$_endPoint/now_playing', optionalQueries: para);
  }

  /// Get a list of the current popular movies on TMDb.
  /// This list updates daily.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///`region`:Specify a ISO 3166-1 code to filter release dates. Must be uppercase. *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getPopular();
  ///```
  ///
  @Deprecated('This method is a typo. Use getPopular() instead')
  Future<Map> getPouplar({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) {
    return getPopular(language: language, page: page, region: region);
  }

  /// Get a list of the current popular movies on TMDb.
  /// This list updates daily.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///`region`:Specify a ISO 3166-1 code to filter release dates. Must be uppercase. *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getPopular();
  ///```
  ///
  Future<Map> getPopular({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) {
    if (page < 1 || page > 1000) {
      throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
    }

    final para = <String>['language=$language', 'page=$page'];
    if (region != null) {
      para.add('region=$region');
    }
    return _v._query('$_endPoint/popular', optionalQueries: para);
  }

  /// Get the top rated movies on TMDb.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///`region`:Specify a ISO 3166-1 code to filter release dates. Must be uppercase. *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getTopRated();
  ///```
  ///
  Future<Map> getTopRated({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) {
    if (page < 1 || page > 1000) {
      throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
    }

    final para = <String>['language=$language', 'page=$page'];
    if (region != null) {
      para.add('region=$region');
    }

    return _v._query('$_endPoint/top_rated', optionalQueries: para);
  }

  ///Get a list of upcoming movies in theatres.
  ///This is a release type query that looks for all movies
  ///that have a release type of 2 or 3 within the specified date range.
  ///
  ///You can optionally specify a [region] parameter
  ///which will narrow the search to only look for
  ///theatrical release dates within the specified country.
  ///
  ///## Parameters
  ///`movieId`: Id of a given movie.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///`region`:Specify a ISO 3166-1 code to filter release dates. Must be uppercase. *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getUpcoming();
  ///```
  ///
  Future<Map> getUpcoming({
    String language = 'en-US',
    int page = 1,
    String? region,
  }) {
    if (page < 1 || page > 1000) {
      throw ArgumentError('movieId < 1 || page < 1 || page > 1000 is true');
    }

    final para = <String>['language=$language', 'page=$page'];
    if (region != null) {
      para.add('region=$region');
    }

    return _v._query('$_endPoint/upcoming', optionalQueries: para);
  }

  /// Powered by our partnership with JustWatch,
  /// you can query this method to get a list of the
  /// availabilities per country by provider.
  /// This is not going to return full deep links,
  /// but rather, it's just enough information to
  /// display what's available where.
  /// You can link to the provided TMDB URL to help
  /// support TMDB and provide the actual deep links to the content.
  /// Please note: In order to use this data you must attribute
  /// the source of the data as JustWatch. If we find any usage not
  /// complying with these terms we will revoke access to the API.
  ///## Parameters
  ///
  ///`movieId`: Id of a given movie.
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.movies.getWatchProviders();
  ///```
  ///
  Future getWatchProviders(int movieId) {
    return _v._query(
      '$_endPoint/$movieId/watch/providers',
    );
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
  Future<Map> rateMovie(
    int movieId,
    double ratingValue, {
    String? guestSessionId,
    String? sessionId,
  }) {
    if (guestSessionId == null && sessionId == null) {
      throw ArgumentError('guestSessionId == null && sessionId == null');
    }
    if (ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1) {
      throw ArgumentError(
        'ratingValue < 0.5 || ratingValue > 10.0 || movieId < 1',
      );
    }

    final para = <String>[];
    //only one is allowed
    if (sessionId != null) {
      para.add('session_id=$sessionId');
    } else {
      para.add('guest_session_id=$guestSessionId');
    }

    return _v._query(
      '$_endPoint/$movieId/rating',
      method: HttpMethod.post,
      postBody: {'value': '$ratingValue'},
      optionalQueries: para,
    );
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
  Future<Map> deleteRating(
    int movieId, {
    String? guestSessionId,
    String? sessionId,
  }) {
    if (movieId < 1) {
      throw ArgumentError('movieId < 1 is true');
    }

    final para = <String>[];
    //only one is allowed
    if (sessionId != null) {
      para.add('session_id=$sessionId');
    } else {
      para.add('guest_session_id=$guestSessionId');
    }

    return _v._query(
      '$_endPoint/$movieId/rating',
      method: HttpMethod.delete,
      deleteBody: {},
      optionalQueries: para,
    );
  }

  ///Get the images that belong to a movie.
  ///

  ///
  ///## Parameters
  ///`movieId`: Id of a movie
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
  Future<Map> getImages(
    int movieId, {
    String language = 'en-US',
    String? includeImageLanguage,
  }) {
    if (movieId < 1) {
      throw ArgumentError('movieId < 1 is true');
    }

    final para = <String>['language=$language'];
    if (includeImageLanguage != null) {
      para.add('include_image_language=$includeImageLanguage');
    }

    return _v._query('$_endPoint/$movieId/images', optionalQueries: para);
  }

  ///Grab the following account states for a session:
  ///
  ///- Movie rating
  ///- If it belongs to your watchlist
  ///- If it belongs to your favourite list
  ///
  ///## Parameters
  ///`movieId`: id of the movie
  ///
  ///`guestSessionId`: id of guest session
  ///
  ///`sessionId`: id of session
  ///
  ///only one of this `guestSessionId` or `sessionId` allowed
  ///if both values are provided sessionId will be given priority
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.movies.getAccountStatus(12,
  ///               sessionId: '5129b38561c99f577bd85cc7f2ff47bb79735902');
  ///```
  ///## Result
  ///```
  ///{
  ///   id: 12,
  ///   favorite: false,
  ///   rated: {value: 5.0},
  ///   watchlist: false
  ///}
  ///```
  ///
  Future<Map> getAccountStatus(
    int movieId, {
    String? sessionId,
    String? guestSessionId,
  }) {
    if (movieId < 1) {
      throw ArgumentError('movieId<1');
    }
    if (sessionId == null && guestSessionId == null) {
      throw ArgumentError('sessionId==null && guestSessionId==null is true');
    }
    final para = <String>[];
    //only one is allowed
    if (sessionId != null) {
      para.add('session_id=$sessionId');
    } else {
      para.add('guest_session_id=$guestSessionId');
    }

    return _v._query(
      '$_endPoint/$movieId/account_states',
      optionalQueries: para,
    );
  }
}
