part of tmdb_api;

class Search {
  final TMDB _tmdb;
  final String _endPoint = 'search';
  Search(this._tmdb);

  ///Search for companies.
  ///
  ///`query` and `page` should not be null
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.search.queryCompanies('Sony Pictures');
  ///```
  Future<Map> queryCompanies(String query, {Parameters parameters}) {
    if (query == null) //throw Exception if query parameter is null
      throw NullValueException('query==null is true',
          source: 'Search.queryCompanies($query)',
          help: 'try passing non null value');
    return _tmdb._query('$_endPoint/company',
        parameters: parameters, optionalQueries: ['query=$query']);
  }

  ///Search for collections.
  ///
  ///`query`, `page` and `language` should not be null
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.search.queryCollections('Sony Pictures');
  ///```
  Future<Map> queryCollections(String query, {Parameters parameters}) {
    if (query == null) //throw Exception if query parameter is null
      throw NullValueException('query==null is true',
          source: 'Search.queryCollections($query)',
          help: 'try passing non null value');
    return _tmdb._query('$_endPoint/collection',
        parameters: parameters, optionalQueries: ['query=$query']);
  }

  ///Search for Keywords.
  ///
  ///`query` and `page` should not be null
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.search.queryKeywords('Sony Pictures');
  ///```
  Future<Map> queryKeywords(String query, {Parameters parameters}) {
    if (query == null) //throw Exception if query parameter is null
      throw NullValueException('query==null is true',
          source: 'Search.queryKeywords($query)',
          help: 'try passing non null value');
    return _tmdb._query('$_endPoint/keyword',
        parameters: parameters, optionalQueries: ['query=$query']);
  }

  ///Search for movies.
  ///
  /// ## Parameters
  /// - `query` cannot be null
  /// - `page` default to *1*
  /// - `language` default to *en-US*
  /// - `include_adult` default to false
  /// - `region` default to *US*
  /// - `year` based on year
  /// - `primaryReleaseYear` based on releasse date
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.search.queryMovies('Sony Pictures');
  ///```
  Future<Map> queryMovies(String query,
      {bool includeAdult = false,
      String region = 'US',
      int year,
      int primaryReleaseYear,
      Parameters parameters}) {
    if (query == null) //throw Exception if query parameter is null
      throw NullValueException('query==null is true',
          source: 'Search.queryMovies($query)',
          help: 'try passing non null value');
    List<String> optionalQueries = [];
    //parameters
    optionalQueries.add('query=$query');
    optionalQueries.add('include_adult=$includeAdult');
    optionalQueries.add('region=$region');
    //year will not be added unless provided
    if (year != null) optionalQueries.add('year=$year');
    //primary_release_year will not be added unless provided
    if (primaryReleaseYear != null)
      optionalQueries.add('primary_release_year=$primaryReleaseYear');
    return _tmdb._query('$_endPoint/movie',
        parameters: parameters, optionalQueries: optionalQueries);
  }

  ///Search multiple models in a single request.
  /// Multi search currently supports searching for
  /// movies, tv shows and people in a single request.
  ///
  ///- `query` query string must not be null
  ///- `language` default to *en-US*
  ///- `page` should not be null
  ///- `includeAdult` default to *false*
  ///- `region` defalut to all
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.search.queryMulti('Sony Pictures');
  ///```
  Future<Map> queryMulti(String query,
      {bool includeAdult = false, String region, Parameters parameters}) {
    if (query == null) //throw Exception if query parameter is null
      throw NullValueException('query==null is true',
          source: 'Search.queryMulti($query)',
          help: 'try passing non null value');
    List<String> optionalQueries = [];
    optionalQueries.add('query=$query');
    optionalQueries.add('includeAdult=$includeAdult');
    if (region != null) optionalQueries.add('region=$region');
    return _tmdb._query('$_endPoint/multi',
        parameters: parameters, optionalQueries: optionalQueries);
  }

  ///Search for people.
  ///
  ///- `query` query string must not be null
  ///- `language` default to *en-US*
  ///- `page` should not be null
  ///- `includeAdult` default to *false*
  ///- `region` defalut to all
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.search.queryPeople('Bradley Cooper');
  ///```
  Future<Map> queryPeople(String query,
      {bool includeAdult = false, String region, Parameters parameters}) {
    if (query == null) //throw Exception if query parameter is null
      throw NullValueException('query==null is true',
          source: 'Search.queryPerson($query)',
          help: 'try passing non null value');
    List<String> optionalQueries = [];
    optionalQueries.add('query=$query');
    optionalQueries.add('includeAdult=$includeAdult');
    if (region != null) optionalQueries.add('region=$region');
    return _tmdb._query('$_endPoint/person',
        parameters: parameters, optionalQueries: optionalQueries);
  }

  ///Search multiple models in a single request.
  /// Multi search currently supports searching for
  /// movies, tv shows and people in a single request.
  ///
  ///- `query` query string must not be null
  ///- `language` default to *en-US*
  ///- `page` should not be null
  ///- `includeAdult` default to *false*
  ///- `region` defalut to all
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.search.queryTvShows('Sony Pictures');
  ///```
  Future<Map> queryTvShows(String query,
      {String firstAirDateYear, Parameters parameters}) {
    if (query == null) //throw Exception if query parameter is null
      throw NullValueException('query==null is true',
          source: 'Search.queryTvShows($query)',
          help: 'try passing non null value');
    List<String> optionalQueries = ['query=$query'];
    if (firstAirDateYear != null)
      optionalQueries.add('first_air_date_year=$firstAirDateYear');
    return _tmdb._query('$_endPoint/company',
        parameters: parameters, optionalQueries: optionalQueries);
  }
}
