part of tmdb_api;

class Credit {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'credit';
  Credit(this._tmdb) : assert(_tmdb != null);

  ///Get a movie or TV credit details by id.
  ///
  ///For doc visit https://developers.themoviedb.org/3/credits/get-credit-details
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.credit.getDetails('52542282760ee313280017f9');
  /// ```
  ///
  Future<Map> getDetails(String creditId) {
    // assert(creditId != null && creditId > 0);
    return _tmdb._query('$_endPoint/$creditId');
  }
}
