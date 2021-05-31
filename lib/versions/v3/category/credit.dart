part of tmdb_api;

class Credit extends Category<V3> {
  ///Provides details about movies
  Credit(V3 v)
      : assert(v != null),
        super(v, 'credit');

  ///Get a movie or TV credit details by id.
  ///
  ///For doc [visit](https://developers.themoviedb.org/3/credits/get-credit-details)
  ///
  ///## Parameters
  ///`creditId`:Id of a credit
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.credit.getDetails('52542282760ee313280017f9');
  /// ```
  ///
  Future<Map> getDetails(String creditId) {
    return _v._query('$_endPoint/$creditId');
  }
}
