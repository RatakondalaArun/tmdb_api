part of tmdb_api;

class Collections {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'collection';
  Collections(this._v3) : assert(_v3 != null);

  ///Get collection details by id.
  //For more doc (visit)[https://developers.themoviedb.org/3/collections/get-collection-details]
  ///
  ///## Parameters
  ///`collectionId`:Id of the collection
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// minLength: 2, pattern: ([a-z]{2})-([A-Z]{2}), default: en-US
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.collections.getDetails();
  /// ```
  ///
  Future<Map> getDetails(int collectionId, {String language = 'en-US'}) {
    if (collectionId == null || language == null)
      throw NullValueException('collectionId==null||language==null is true');

    return _v3._query('$_endPoint/$collectionId',
        optionalQueries: ['language=$language']);
  }

  ///Get collection images by id.
  //For more doc (visit)[https://developers.themoviedb.org/3/collections/get-collection-details]
  ///
  ///## Parameters
  ///`collectionId`:Id of the collection
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// minLength: 2, pattern: ([a-z]{2})-([A-Z]{2}), default: en-US
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.collections.getmages();
  /// ```
  ///
  Future<Map> getImages(int collectionId, {String language = 'en-US'}) {
    if (collectionId == null || language == null)
      throw NullValueException('collectionId==null||language==null is true');

    return _v3._query('$_endPoint/$collectionId/images',
        optionalQueries: ['language=$language']);
  }

  ///Get collection translations by id.
  ///
  ///
  ///## Parameters
  ///`collectionId`:Id of the collection
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// minLength: 2, pattern: ([a-z]{2})-([A-Z]{2}), default: en-US
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.collections.getTranslations();
  /// ```
  ///
  Future<Map> getTranslations(int collectionId, {String language = 'en-US'}) {
    return _v3._query('$_endPoint/$collectionId/translations',
        optionalQueries: ['language=$language']);
  }
}
