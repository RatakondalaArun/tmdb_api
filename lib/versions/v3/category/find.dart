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
  /// To know about supported external sources for each object
  /// [visit](https://developers.themoviedb.org/3/find/find-by-id).
  ///## Parameters
  ///`externalId`: external id of the item
  ///
  ///`externalIdSource`: source of the given external id
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// minLength: 2, pattern: ([a-z]{2})-([A-Z]{2}), default: en-US
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.credit.getById('tt8579674',
  ///                                           externalIdSource: ExternalId.imdbId,
  ///                                           language='en-US');
  /// ```
  /// *By default `externalIdSource` is set to IMDB ID*
  Future<Map> getById(String externalId,
      {ExternalId externalIdSource = ExternalId.imdbId,
      String language = 'en-US'}) {
    //null check
    if (externalId == null || externalIdSource == null)
      throw NullValueException(
          'externalId==null || externalIdSource == null is true');

    return _v3._query('$_endPoint/$externalId', optionalQueries: [
      _getSourceQuery(externalIdSource),
      'language=$language'
    ]);
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
