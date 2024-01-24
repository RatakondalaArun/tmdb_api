part of '../../../tmdb_api.dart';

class Reviews extends Category<V3> {
  ///Provides details about movies

  Reviews(V3 v) : super(v, 'review');

  ///Get a movie or TV review details by id.
  ///
  ///## Parameters
  ///- `reviewId`: review id in String *(5488c29bc3a3686f4a00004a)*
  ///
  ///For doc visit https://developers.themoviedb.org/3/credits/get-credit-details
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.reviews.getDetails('5488c29bc3a3686f4a00004a');
  /// ```
  ///
  Future<Map> getDetails(String reviewId) {
    return _v._query('$_endPoint/$reviewId');
  }
}
