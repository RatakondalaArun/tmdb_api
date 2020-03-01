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
  Future<Map> getDetails(int id, {Parameters parameters}) {
    assert(id != null);
    return _v3._query('tv/$_endPoint/$id',
        method: HttpMethod.GET, parameters: parameters);
  }
}
