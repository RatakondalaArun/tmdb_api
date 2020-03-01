part of tmdb_api;

class Collections {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'collection';
  Collections(this._v3) : assert(_v3 != null);

  ///Get collection details by id.
  ///https://developers.themoviedb.org/3/collections/get-collection-details
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.collections.getDetails();
  /// ```
  ///
  Future<Map> getDetails(int collectionId, {Parameters parameters}) {
    return _v3._query('$_endPoint/$collectionId', parameters: parameters);
  }

  ///Get collection images by id.
  ///https://developers.themoviedb.org/3/collections/get-collection-images
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.collections.getImages();
  /// ```
  ///
  Future<Map> getImages(int collectionId, {Parameters parameters}) {
    return _v3._query('$_endPoint/$collectionId/images',
        parameters: parameters);
  }

  ///Get collection translations by id.
  ///https://developers.themoviedb.org/3/collections/get-collection-translations
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.collections.getTranslations();
  /// ```
  ///
  Future<Map> getTranslations(int collectionId, {Parameters parameters}) {
    return _v3._query('$_endPoint/$collectionId/translations',
        parameters: parameters);
  }
}
