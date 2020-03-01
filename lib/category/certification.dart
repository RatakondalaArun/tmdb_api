part of tmdb_api;

class Certification {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'certification';
  Certification(this._v3) : assert(_v3 != null);

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
    return _v3._query('$_endPoint/movie/list');
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
    return _v3._query('$_endPoint/tv/list');
  }
}
