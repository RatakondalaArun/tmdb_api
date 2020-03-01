part of tmdb_api;

class Find {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'find';
  Find(this._v3) : assert(_v3 != null);

  ///The find method makes it easy to search for
  ///objects in our database by an external id. For example, an IMDB ID.
  ///This method will search all objects (movies, TV shows and people)
  /// and return the results in a single response.
  ///
  /// To know about supported external sources for each object visit.
  ///
  ///https://developers.themoviedb.org/3/find/find-by-id
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.credit.getById('tt8579674',externalIdSource: ExternalId.imdbId);
  /// ```
  /// *By default `externalIdSource` is set to IMDB ID*
  Future<Map> getById(String externalId,
      {ExternalId externalIdSource = ExternalId.imdbId,
      Parameters parameters}) {
    return _v3._query('$_endPoint/$externalId',
        parameters: parameters,
        optionalQueries: [_getSourceQuery(externalIdSource)]);
  }

  String _getSourceQuery(ExternalId externalIdSource) {
    switch (externalIdSource) {
      case ExternalId.imdbId:
        return 'external_source=imdb_id';
      case ExternalId.tvdbId:
        return 'external_source=tvdb_id';
      case ExternalId.facebookId:
        return 'external_source=facebook_id';
      case ExternalId.twitterId:
        return 'external_source=twitter_id';
      case ExternalId.instagramId:
        return 'external_source=instagram_id';
      default:
        return 'external_source=imdb_id';
    }
  }
}

enum ExternalId { imdbId, tvdbId, facebookId, twitterId, instagramId }
