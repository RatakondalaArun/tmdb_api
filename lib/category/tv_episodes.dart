part of tmdb_api;

class TvEpisodes {
  final V3 _v3;
  final String _endPoint = 'episode';
  TvEpisodes(this._v3) : assert(_v3 != null);

  /// Get the TV episodes details by id.
  ///
  /// Supports append & language in [parameters],
  /// remaining will be automatically neglected
  Future<Map> getDetails(int tvId, int seasonNumber, int episodeNumber,
      {Parameters parameters}) {
    assert(tvId != null);
    assert(seasonNumber != null);
    assert(episodeNumber != null);
    return _v3._query('tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber',
        method: HttpMethod.GET, parameters: parameters);
  }

  ///Get the changes for a TV episode.
  /// By default only the last 24 hours are returned.
  Future<Map> getChanges(int episodeId, {Parameters parameters}) {
    assert(episodeId != null && episodeId > 0);
    return _v3._query('tv/$_endPoint/$episodeId/changes',
        parameters: parameters);
  }

  ///Get the credits for TV episode.
  ///
  ///seasonNumber, tvId and episodeNumber should be greater than 0
  Future<Map> getCredits(int tvId, int seasonNumber, int episodeNumber) {
    assert(seasonNumber != null && seasonNumber > 0);
    assert(tvId != null && tvId > 0);
    return _v3._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/credits');
  }

  ///Get the external ids for a TV episode.
  ///
  /// We currently support the following external sources.
  ///
  /// - `TVDB ID`
  Future<Map> getExternalId(int tvId, int seasonNumber, int episodeNumber) {
    assert(seasonNumber != null && seasonNumber > 0);
    assert(tvId != null && tvId > 0);
    return _v3._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/external_ids');
  }

  ///Get the images that belong to a TV season.
  Future<Map> getImages(int tvId, int seasonNumber, int episodeNumber) {
    assert(seasonNumber != null && seasonNumber > 0 && episodeNumber > 0);
    assert(tvId != null && tvId > 0);
    return _v3._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/images');
  }

  ///Get the videos that have been added to a TV episodes.
  Future<Map> getVideos(int tvId, int seasonNumber, int episodeNumber) {
    assert(seasonNumber != null && seasonNumber > 0);
    assert(tvId != null && tvId > 0);
    return _v3._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/videos');
  }

  ///Get the translation data for an episode.
  Future<Map> getTranslation(int tvId, int seasonNumber, int episodeNumber) {
    assert(seasonNumber != null && seasonNumber > 0 && episodeNumber > 0);
    return _v3._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/translations');
  }
}
