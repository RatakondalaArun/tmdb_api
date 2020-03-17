part of tmdb_api;

class TvEpisodeGroup {
  //!test failed
  final V3 _v3;
  final String _endPoint = 'episode_group';

  TvEpisodeGroup(this._v3) : assert(_v3 != null);

  /// Get the details of a TV episode group.
  ///
  /// Groups support 7 different types which are enumerated as the following:
  /// Original air date
  /// - `Absolute`
  /// - `DVD`
  /// - `Digital`
  /// - `Story arc`
  /// - `Production`
  /// - `TV`
  ///
  /// ## Parameters
  /// `id`:
  ///
  /// `language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// ## Implementation
  /// ```
  /// Map result = tmdb.v3.tvEpisodeGroup.getDetails(12);
  /// ```
  Future<Map> getDetails(String id, {String language = 'en-US'}) {
    if (id == null || language == null) {
      throw NullValueException('id == null || language==null is true');
    }

    return _v3._query('tv/$_endPoint/$id',
        method: HttpMethod.GET, optionalQueries: ['language=$language']);
  }
}
