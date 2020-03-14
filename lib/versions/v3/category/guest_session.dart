part of tmdb_api;

class GuestSession {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'guest_session';
  GuestSession(this._v3) : assert(_v3 != null);

  ///Get the rated movies for a guest session.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///
  /// ## Implementation
  ///```
  /// Map result = await tmdb.v3.guestSession
  /// .getRatedMovies('8e97e86d024d2952c4a637351116116e');
  /// ```
  /// ## Result
  /// ```
  /// {
  ///     page: 1,
  ///     results: [],
  ///     total_pages: 0,
  ///     total_results: 0
  /// }
  /// ```
  ///
  Future<Map> getRatedMovies(String guestSessionId,
      {String language = 'en-US', SortBy sortBy = SortBy.createdAtAsc}) {
    if (guestSessionId == null || language == null || sortBy == null)
      throw NullValueException(
          'guestSessionId == null||language==null||sortBy==null is true');

    String sort;
    if (sortBy == SortBy.createdAtAsc)
      sort = 'created_at.asc';
    else
      sort = 'created_at.desc';
    return _v3._query('$_endPoint/$guestSessionId/rated/movies',
        optionalQueries: [
          'guest_session_id=$guestSessionId',
          'language=$language',
          'sort_by=$sort'
        ]);
  }

  ///Get the rated TV shows for a guest session.
  ///
  ///## Parameters
  ///`guestSessionId`: a guest session which can be generated using `tmdb.v3.auth.createGuestSession();`
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///
  /// ## Implementation
  ///```
  /// Map result = await tmdb.v3.guestSession
  ///                     .getRatedTvShows('8e97e86d024d2952c4a637351116116e');
  /// ```
  /// ## Result
  /// ```
  /// {
  ///     page: 1,
  ///     results: [],
  ///     total_pages: 0,
  ///     total_results: 0
  /// }
  /// ```
  ///
  Future<Map> getRatedTvShows(String guestSessionId,
      {String language = 'en-US', SortBy sortBy = SortBy.createdAtAsc}) {
    if (guestSessionId == null || language == null || sortBy == null)
      throw NullValueException(
          'guestSessionId == null ||language==null||sortBy==null is true');

    String sort;
    if (sortBy == SortBy.createdAtAsc)
      sort = 'created_at.asc';
    else
      sort = 'created_at.desc';
    return _v3._query('$_endPoint/$guestSessionId/rated/tv', optionalQueries: [
      'guest_session_id=$guestSessionId',
      'language=$language',
      'sort_by=$sort'
    ]);
  }

  ///Get the rated TV shows for a guest session.
  ///
  ///## Parameters
  ///`guestSessionId`: a guest session which can be generated using `tmdb.v3.auth.createGuestSession();`
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///
  /// ## Implementation
  ///```
  /// Map result = await tmdb.v3.guestSession
  ///                     .getRatedTvEpisodes('8e97e86d024d2952c4a637351116116e');
  /// ```
  /// ## Result
  /// ```
  /// {
  ///     page: 1,
  ///     results: [],
  ///     total_pages: 0,
  ///     total_results: 0
  /// }
  /// ```
  ///
  Future<Map> getRatedTvEpisodes(String guestSessionId,
      {String language = 'en-US', SortBy sortBy = SortBy.createdAtAsc}) {
    if (guestSessionId == null || language == null || sortBy == null)
      throw NullValueException(
          'guestSessionId == null ||language==null||sortBy==null is true');

    String sort;
    if (sortBy == SortBy.createdAtAsc)
      sort = 'created_at.asc';
    else
      sort = 'created_at.desc';
    return _v3._query('$_endPoint/$guestSessionId/rated/tv/episodes',
        optionalQueries: [
          'guest_session_id=$guestSessionId',
          'language=$language',
          'sort_by=$sort'
        ]);
  }
}
