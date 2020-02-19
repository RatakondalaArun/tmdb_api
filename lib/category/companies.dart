part of tmdb_api;

class Companies {
  ///Provides details about movies
  final TMDB _tmdb;
  final String _endPoint = 'company';
  Companies(this._tmdb) : assert(_tmdb != null);

  /// Get a companies details by id.
  ///
  /// Takes `companyId` as parameter of type [int]
  ///
  /// *Usage:*
  ///
  /// ```
  /// Map result=await tmdb.companies.getMovie(1);
  ///```
  ///
  ///*Result:*
  /// ```
  /// {
  ///   "description": "",
  ///   "headquarters": "San Francisco, California, United States",
  ///   "homepage": "http://www.lucasfilm.com",
  ///   "id": 1,
  ///   "logo_path": "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
  ///   "name": "Lucasfilm",
  ///   "origin_country": "US",
  ///   "parent_company": null
  /// }
  /// ```
  ///
  ///For more details visit https://developers.themoviedb.org/3/companies/get-company-details
  Future<Map> getDetails(int companyId) {
    return _tmdb._query('$_endPoint/$companyId');
  }

  /// Get the alternative names of a company.
  ///
  /// Takes `companyId` as parameter of type [int]
  ///
  ///*Usage:*
  ///
  ///```
  /// Map result=await tmdb.companies.getAlternativeNames(3);
  ///```
  ///
  ///*Result:*
  ///```
  /// {
  ///   "id": 3,
  ///   "results": [
  ///     {
  ///       "name": "Pixar Animation Studios",
  ///       "type": ""
  ///     }
  ///   ]
  /// }
  /// ```
  Future<Map> getAlternativeNames(int companyId) {
    return _tmdb._query('$_endPoint/$companyId');
  }

  /// Get a companies logos by id.
  ///
  /// There are two image formats that are supported for companies,
  /// PNG's and SVG's. You can see which type the
  ///original file is by looking at the file_type field.
  ///We prefer SVG's as they are resolution independent and as such,
  ///the width and height are only there to reflect the original
  ///asset that was uploaded. An SVG can be scaled properly
  ///beyond those dimensions if you call them as a PNG.
  ///
  ///
  /// Takes `companyId` as parameter of type [int]
  ///
  ///*Usage:*
  ///
  ///```
  /// Map result=await tmdb.companies.getImages(1);
  ///```
  ///
  ///*Result:*
  ///```
  ///   {
  ///   "id": 1,
  ///   "logos": [
  ///     {
  ///       "aspect_ratio": 2.97979797979798,
  ///       "file_path": "/o86DbpburjxrqAzEDhXZcyE8pDb.png",
  ///       "height": 99,
  ///       "id": "5aa080d6c3a3683fea00011e",
  ///       "file_type": ".svg",
  ///       "vote_average": 0,
  ///       "vote_count": 0,
  ///       "width": 295
  ///     }
  ///   ]
  /// }
  /// ```
  /// For doc https://developers.themoviedb.org/3/companies/get-company-images
  ///
  ///
  /// For more information about how SVG's and PNG's can be used, take a read through
  /// https://developers.themoviedb.org/3/getting-started/images
  Future<Map> getImages(int companyId) {
    return _tmdb._query('$_endPoint/$companyId');
  }
}
