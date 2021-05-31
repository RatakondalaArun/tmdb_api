part of tmdb_api;

class TvSeasons extends Category<V3> {
  TvSeasons(V3 v)
      : assert(v != null),
        super(v, 'season');

  /// Get the TV season details by id.
  ///
  ///## Parameters
  ///`tvID`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`appendToResponse`: Append requests within the same namespace to the response. *pattern: ([\w]+)*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvSeasons.getDetails(103, 1,
  ///language: 'en-US', appendToResponse: 'videos,images');
  ///```
  ///
  Future<Map> getDetails(
    int tvId,
    int seasonNumber, {
    String appendToResponse,
    String language = 'en=US',
  }) {
    List<String> para = ['language=$language'];
    if (appendToResponse != null) {
      para.add('append_to_response=$appendToResponse');
    }

    return _v._query('tv/$tvId/$_endPoint/$seasonNumber',
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
  Future<Map> getAggregateCredits(
    String tvId,
    String seasonNumber, {
    String language = 'en-US',
  }) {
    return _v._query(
      'tv/$tvId/$_endPoint/$seasonNumber/aggregate_credits',
      optionalQueries: ['language=$language'],
    );
  }

  ///Get the changes for a TV season.
  /// By default only the last 24 hours are returned.
  ///
  ///## Parameters
  ///`seasonId`: id of the tv season
  ///
  ///`startDate`:Filter the results with a start date. *format: date*
  ///
  ///`endDate`: Filter the results with a end date. *format: date*
  ///
  ///`page`: Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvSeasons.getChanges(302, page: 2);
  ///```
  Future<Map> getChanges(
    int seasonId, {
    String startDate,
    String endDate,
    int page = 1,
  }) {
    List<String> para = ['page=$page'];
    if (startDate != null) {
      para.add('start_date=$startDate');
    }
    if (endDate != null) {
      para.add('end_date=$endDate');
    }

    return _v._query('tv/$_endPoint/$seasonId/changes', optionalQueries: para);
  }

  ///Get the credits for TV season.
  ///
  /// Get the TV season details by id.
  ///
  ///## Parameters
  ///`tvID`: id of the tv show
  ///
  ///`sesonNumber`:season number of that tv show
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`appendToResponse`: Append requests within the same namespace to the response. *pattern: ([\w]+)*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.tvSeasons.getCredits(103, 1, 1);
  ///```
  ///
  Future<Map> getCredits(
    int tvId,
    int seasonNumber, {
    String language = 'en-US',
  }) {
    if (seasonNumber < 1 || tvId < 1) {
      throw InvalidDataException('seasonNumber<1||tvId<1 is true');
    }
    return _v._query('tv/$tvId/$_endPoint/$seasonNumber/credits',
        optionalQueries: ['language=$language']);
  }

  ///Get the external ids for a TV season.
  ///
  /// We currently support the following external sources.
  ///
  /// - `TVDB ID`
  Future<Map> getExternalId(
    int tvId,
    int seasonNumber, {
    String language = 'en-US',
  }) {
    if (tvId < 1 || seasonNumber < 1) {
      throw InvalidDataException('tvId<1||seasonNumber<1 is true');
    }

    return _v._query('tv/$tvId/$_endPoint/$seasonNumber/external_ids',
        optionalQueries: ['language=$language']);
  }

  ///Get the images that belong to a TV season.
  Future<Map> getImages(
    int tvId,
    int seasonNumber, {
    String language = 'en-US',
  }) {
    if (tvId < 1 || seasonNumber < 1) {
      throw InvalidDataException('tvId<1||seasonNumber<1 is true');
    }

    return _v._query('tv/$tvId/$_endPoint/$seasonNumber/images',
        optionalQueries: ['language=$language']);
  }

  ///Get the videos that have been added to a TV season.
  Future<Map> getVideos(
    int tvId,
    int seasonNumber, {
    String language = 'en-US',
  }) {
    if (tvId < 1 || seasonNumber < 1) {
      throw InvalidDataException('tvId<1||seasonNumber<1 is true');
    }

    return _v._query('tv/$tvId/$_endPoint/$seasonNumber/videos',
        optionalQueries: ['language=$language']);
  }
}
