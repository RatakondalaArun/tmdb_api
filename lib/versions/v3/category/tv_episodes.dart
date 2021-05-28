part of tmdb_api;

class TvEpisodes extends Category<V3> {
  TvEpisodes(V3 v)
      : assert(v != null),
        super(v, 'episode');

  /// Get the TV episodes details by id.
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`episodeNumber`: episode number of that tv show
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`appendToResponse`: Append requests within the same namespace to the response. *pattern: ([\w]+)*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvEpisodes.getDetails(103, 1, 1,
  ///language: 'en-US', appendToResponse: 'videos,images');
  ///```
  ///
  Future<Map> getDetails(int tvId, int seasonNumber, int episodeNumber,
      {String appendToResponse, String language = 'en-US'}) {
    if (tvId == null ||
        seasonNumber == null ||
        episodeNumber == null ||
        language == null) {
      throw NullValueException(
          'tvId == null || seasonNumber == null || episodeNumber == null || language == null is true');
    }
    List<String> para = ['language=$language'];
    if (appendToResponse != null) {
      para.add('append_to_response=$appendToResponse');
    }

    return _v._query('tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber',
        method: HttpMethod.GET, optionalQueries: para);
  }

  ///Get the changes for a TV episode.
  /// By default only the last 24 hours are returned.
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`startDate`:Filter the results with a start date. *format: date*
  ///
  ///`endDate`: Filter the results with a end date. *format: date*
  ///
  ///`page`: Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvEpisodes.getChanges(302, page: 2);
  ///```
  Future<Map> getChanges(int episodeId,
      {String startDate, String endDate, int page = 1}) {
    if (episodeId == null || page == null) {
      throw NullValueException('episodeId == null || page == null is true');
    }

    List<String> para = ['page=$page'];
    if (startDate != null) {
      para.add('start_date=$startDate');
    }
    if (endDate != null) {
      para.add('end_date=$endDate');
    }

    return _v._query('tv/$_endPoint/$episodeId/changes', optionalQueries: para);
  }

  ///Get the credits for TV episode.
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`episodeNumber`: episode number of that tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvEpisodes.getCredits(103, 1, 1);
  ///```
  ///
  Future<Map> getCredits(int tvId, int seasonNumber, int episodeNumber) {
    if (seasonNumber == null || tvId == null || episodeNumber == null) {
      throw NullValueException(
          'seasonNumber==null||tvId==null||episodeNumber==null is true');
    }
    if (seasonNumber < 1 || tvId < 1 || episodeNumber < 1) {
      throw InvalidDataException(
          'seasonNumber<1||tvId<1||episodeNumber<1 is true');
    }
    return _v._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/credits');
  }

  ///Get the external ids for a TV episode.
  ///
  /// We currently support the following external sources.
  ///
  /// - `TVDB ID`
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`episodeNumber`: episode number of that tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvEpisodes.getExternalId(103, 1, 1);
  ///```
  ///
  Future<Map> getExternalId(int tvId, int seasonNumber, int episodeNumber) {
    if (seasonNumber == null || tvId == null || episodeNumber == null) {
      throw NullValueException(
          'seasonNumber==null||tvId==null||episodeNumber==null is true');
    }
    if (seasonNumber < 1 || tvId < 1 || episodeNumber < 1) {
      throw InvalidDataException(
          'seasonNumber<1||tvId<1||episodeNumber<1 is true');
    }
    return _v._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/external_ids');
  }

  ///Get the images that belong to a TV season.
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`episodeNumber`: episode number of that tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvEpisodes.getImages(103, 1, 1);
  ///```
  ///
  Future<Map> getImages(int tvId, int seasonNumber, int episodeNumber) {
    if (seasonNumber == null || tvId == null || episodeNumber == null) {
      throw NullValueException(
          'seasonNumber==null||tvId==null||episodeNumber==null is true');
    }
    if (seasonNumber < 1 || tvId < 1 || episodeNumber < 1) {
      throw InvalidDataException(
          'seasonNumber<1||tvId<1||episodeNumber<1 is true');
    }
    return _v._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/images');
  }

  ///Get the videos that have been added to a TV episodes.
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`episodeNumber`: episode number of that tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvEpisodes.getvIdeos(103, 1, 1);
  ///```
  ///
  Future<Map> getVideos(int tvId, int seasonNumber, int episodeNumber) {
    if (seasonNumber == null || tvId == null || episodeNumber == null) {
      throw NullValueException(
          'seasonNumber==null||tvId==null||episodeNumber==null is true');
    }
    if (seasonNumber < 1 || tvId < 1 || episodeNumber < 1) {
      throw InvalidDataException(
          'seasonNumber<1||tvId<1||episodeNumber<1 is true');
    }
    return _v._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/videos');
  }

  ///Get the translation data for an episode.
  ///
  ///## Parameters
  ///`tvId`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`episodeNumber`: episode number of that tv show
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvEpisodes.getDetails(103, 1, 1);
  ///```
  ///
  Future<Map> getTranslation(int tvId, int seasonNumber, int episodeNumber) {
    if (seasonNumber == null || tvId == null || episodeNumber == null) {
      throw NullValueException(
          'seasonNumber==null||tvId==null||episodeNumber==null is true');
    }
    if (seasonNumber < 1 || tvId < 1 || episodeNumber < 1) {
      throw InvalidDataException(
          'seasonNumber<1||tvId<1||episodeNumber<1 is true');
    }
    return _v._query(
        'tv/$tvId/season/$seasonNumber/$_endPoint/$episodeNumber/translations');
  }
}
