part of tmdb_api;

class Certification extends Category<V3> {
  ///Provides details about movies
  Certification(V3 v)
      : assert(v != null),
        super(v, 'certification');

  ///Get an up to date list of the officially
  ///supported movie certifications on TMDb.
  ///
  ///For doc visit https://developers.themoviedb.org/3/certifications/get-movie-certifications
  ///
  ///## No Parameters
  ///
  ///
  ///## Implementation
  ///```
  /// Map result = await tmdb.certification.getMovie();
  /// ```
  ///
  Future<Map> getMovie() {
    return _v._query('$_endPoint/movie/list');
  }

  ///Get an up to date list of the officially
  ///supported tv shows certifications on TMDb.
  ///
  ///For doc visit https://developers.themoviedb.org/3/certifications/get-tv-certifications
  ///
  ///## No Parameters
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.certification.getTv();
  ///```
  ///
  Future<Map> getTv() {
    return _v._query('$_endPoint/tv/list');
  }
}
