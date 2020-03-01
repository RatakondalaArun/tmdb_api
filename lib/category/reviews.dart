part of tmdb_api;

class Reviews {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'review';
  Reviews(this._tmdb) : assert(_tmdb != null);

  ///Get a movie or TV review details by id.
  ///
  ///## Parameters
  ///- `reviewId`: review id in String *(5488c29bc3a3686f4a00004a)*
  ///
  ///For doc visit https://developers.themoviedb.org/3/credits/get-credit-details
  ///
  ///## Usage
  ///
  ///```
  /// Map result = await tmdb.reviews.getDetails('5488c29bc3a3686f4a00004a');
  /// ```
  ///
  Future<Map> getDetails(String reviewId) {
    if (reviewId == null)
      throw NullValueException('reviewId == null is true',
          source: 'reviews.getDetails($reviewId)',
          help: 'try to not to pass a null value');

    return _tmdb._query('$_endPoint/$reviewId');
  }
}
