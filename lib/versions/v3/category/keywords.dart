part of tmdb_api;

class Keywords {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'keyword';
  Keywords(this._v3) : assert(_v3 != null);

  ///Get the list of official genres for movies.
  ///
  ///For doc [visit](https://developers.themoviedb.org/3/genres/get-movie-list)
  ///## Parameters
  /// `keywordId`: id of a keyword
  ///## Implementation
  ///```
  /// Map result = await tmdb.v3.keywords.getMovies(3417);
  ///```
  Future<Map> getDetails(int keywordId) {
    if (keywordId == null) {
      throw NullValueException('keywordId == null');
    }

    return _v3._query('$_endPoint/$keywordId');
  }

  /// Get the movies that belong to a keyword.
  ///
  /// We highly recommend using `movie.discover` instead of this method as it is much more flexible.
  /// ## Parameters
  /// `keywordId`: id of a keyword
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2, pattern: ([a-z]{2})-([A-Z]{2}), default: en-US*
  ///
  ///`includeAdult`: Choose whether to inlcude adult (pornography) content in the results.
  ///*default: false*
  ///
  ///## Implementation
  ///```
  /// Map result = await tmdb.v3.keywords.getMovies(3417);
  ///```
  Future<Map> getMovies(int keywordId,
      {String language = 'en-US', bool includeAdult = false}) {
    if (keywordId == null || language == null || includeAdult == null) {
      throw NullValueException(
          'keywordId==null||language==null||includeAdult==null');
    }

    return _v3._query('$_endPoint/$keywordId',
        optionalQueries: ['include_adult=$includeAdult', 'language=$language']);
  }
}
