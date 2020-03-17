part of tmdb_api;

class Credit {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'credit';
  Credit(this._v3) : assert(_v3 != null);

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
    if (creditId == null) {
      throw NullValueException('creditId==null');
    }

    return _v3._query('$_endPoint/$creditId');
  }
}
