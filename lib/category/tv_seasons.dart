part of tmdb_api;

class TvSeasons {
  final TMDB _tmdb;
  final String _endPoint = 'season';
  TvSeasons(this._tmdb) : assert(_tmdb != null);

  /// Get the TV season details by id.
  ///
  /// Supports append & language in [parameters],
  /// remaining will be automatically neglected
  Future<Map> getDetails(int tvId, int seasonNumber, {Parameters parameters}) {
    assert(tvId != null);
    return _tmdb._query('tv/$tvId/$_endPoint/$seasonNumber',
        method: HttpMethod.GET, parameters: parameters);
  }

  ///Get the changes for a TV season.
  /// By default only the last 24 hours are returned.
  Future<Map> getChanges(int seasonId, {Parameters parameters}) {
    assert(seasonId != null && seasonId > 0);
    return _tmdb._query('tv/$_endPoint/$seasonId/changes',
        parameters: parameters);
  }

  ///Get the credits for TV season.
  ///
  ///seasonNumber should be greater than 0
  Future<Map> getCredits(int tvId, int seasonNumber, {Parameters parameters}) {
    assert(seasonNumber != null && seasonNumber > 0);
    assert(tvId != null && tvId > 0);
    return _tmdb._query('tv/$tvId/$_endPoint/$seasonNumber/credits',
        parameters: parameters);
  }

  ///Get the external ids for a TV season.
  ///
  /// We currently support the following external sources.
  ///
  /// - `TVDB ID`
  Future<Map> getExternalId(int tvId, int seasonNumber) {
    assert(seasonNumber != null && seasonNumber > 0);
    assert(tvId != null && tvId > 0);
    return _tmdb._query('tv/$tvId/$_endPoint/$seasonNumber/external_ids');
  }

  ///Get the images that belong to a TV season.
  Future<Map> getImages(int tvId, int seasonNumber) {
    assert(seasonNumber != null && seasonNumber > 0);
    assert(tvId != null && tvId > 0);
    return _tmdb._query('tv/$tvId/$_endPoint/$seasonNumber/images');
  }

  ///Get the videos that have been added to a TV season.
  Future<Map> getVideos(int tvId, int seasonNumber) {
    assert(seasonNumber != null && seasonNumber > 0);
    assert(tvId != null && tvId > 0);
    return _tmdb._query('tv/$tvId/$_endPoint/$seasonNumber/videos');
  }
}
