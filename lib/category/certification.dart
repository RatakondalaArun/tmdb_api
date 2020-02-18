part of tmdb_api;

class Certification {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'certification';
  Certification(this._tmdb) : assert(_tmdb != null);

  ///Get an up to date list of the officially
  ///supported movie certifications on TMDb.
  ///
  ///For doc visit https://developers.themoviedb.org/3/certifications/get-movie-certifications
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.certification.getMovie();
  /// ```
  ///
  Future<Map> getMovie() {
    return _tmdb._query('$_endPoint/movie/list');
  }

  ///Get an up to date list of the officially
  ///supported tv shows certifications on TMDb.
  ///
  ///For doc visit https://developers.themoviedb.org/3/certifications/get-tv-certifications
  ///
  ///*Usage*
  ///
  ///```
  /// Map result = await tmdb.certification.getTv();
  /// ```
  ///
  Future<Map> getTv() {
    return _tmdb._query('$_endPoint/tv/list');
  }
}
