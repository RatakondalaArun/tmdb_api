part of tmdb_api;

class Search {
  final V3 _v3;
  final String _endPoint = 'search';
  Search(this._v3);

  ///Search for companies.
  ///
  ///## Parameters
  ///`query`: Pass a text query to search. *minLength: 1*
  ///
  ///`page`: Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.search.queryCompanies('Sony Pictures');
  ///```
  Future<Map> queryCompanies(String query, {int page = 1}) {
    if (query == null ||
        page == null) //throw Exception if query parameter is null
    {
      throw NullValueException('query==null is true');
    }
    if (page < 1 || page > 1000) {
      throw InvalidDataException('page < 1 || page > 1000');
    }

    return _v3._query('$_endPoint/company',
        optionalQueries: ['query=$query', 'page=$page']);
  }

  ///Search for collections.
  ///
  ///## Parameters
  ///`query`: Pass a text query to search. *minLength: 1*
  ///
  ///`page`: Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///`language`:Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.search.queryCollections('Sony Pictures');
  ///```
  Future<Map> queryCollections(String query,
      {String language = 'en-US', int page = 1}) {
    if (query == null ||
        language == null ||
        page == null) //throw Exception if query parameter is null
    {
      throw NullValueException(
          'query == null || language == null ||page == null is true');
    }
    if (page < 1 || page > 1000) {
      throw InvalidDataException('page < 1 || page > 1000');
    }

    return _v3._query('$_endPoint/collection',
        optionalQueries: ['query=$query', 'page=$page', 'language=$language']);
  }

  ///Search for Keywords.
  ///
  ///## Parameters
  ///`query`: Pass a text query to search. *minLength: 1*
  ///
  ///`page`: Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.search.queryKeywords('Sony Pictures');
  ///```
  Future<Map> queryKeywords(String query, {int page = 1}) {
    if (query == null ||
        page == null) //throw Exception if query parameter is null
    {
      throw NullValueException('query==null is true');
    }
    if (page < 1 || page > 10000) {
      throw InvalidDataException('page<1||page>10000 is true');
    }

    return _v3._query('$_endPoint/keyword',
        optionalQueries: ['query=$query', 'page=$page']);
  }

  ///Search for movies.
  ///
  /// ## Parameters
  ///  `query`: Pass a text query to search. This value should be URI encoded. *minLength: 1*
  ///
  ///  `page`: Specify which page to query.
  /// *minimum: 1 maximum: 1000 default: 1*
  ///
  ///  `language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///  `include_adult`: Choose whether to inlcude adult content in the results. *default:false*
  ///
  ///  `region`: Specify a ISO 3166-1 code to filter release dates. Must be uppercase.
  ///  *pattern: ^[A-Z]{2}$*
  ///
  ///  `year`: based on year
  ///
  ///  `primaryReleaseYear`: based on releasse date
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.search.queryMovies('Sony Pictures');
  ///```
  Future<Map> queryMovies(String query,
      {bool includeAdult = false,
      String region = 'US',
      int year,
      int primaryReleaseYear,
      String language = 'en-US',
      int page = 1}) {
    if (query == null ||
        language == null ||
        page == null ||
        region == null ||
        includeAdult == null) //throw Exception if query parameter is null
    {
      throw NullValueException(
          'query == null || language == null || page == null || region == null||includeAdult==null is true');
    }
    //this parameters should not be nll so adding first
    List<String> optionalQueries = [
      'query=$query',
      'include_adult=$includeAdult',
      'region=$region',
      'page=$page',
    ];
    //this parameters may contains null
    //year will not be added unless provided
    if (year != null) {
      optionalQueries.add('year=$year');
    }
    //primary_release_year will not be added unless provided
    if (primaryReleaseYear != null) {
      optionalQueries.add('primary_release_year=$primaryReleaseYear');
    }

    return _v3._query('$_endPoint/movie', optionalQueries: optionalQueries);
  }

  ///Search multiple models in a single request.
  /// Multi search currently supports searching for
  /// movies, tv shows and people in a single request.
  ///
  /// ## Parameters
  ///  `query`: Pass a text query to search. This value should be URI encoded. *minLength: 1*
  ///
  ///  `page`: Specify which page to query.
  /// *minimum: 1 maximum: 1000 default: 1*
  ///
  ///  `language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///  `include_adult`: Choose whether to inlcude adult content in the results. *default:false*
  ///
  ///  `region`: Specify a ISO 3166-1 code to filter release dates. Must be uppercase.
  ///  *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.search.queryMulti('Sony Pictures');
  ///```
  Future<Map> queryMulti(String query,
      {bool includeAdult = false,
      String region,
      String language = 'en-US',
      int page = 1}) {
    if (query == null ||
        includeAdult == null ||
        language == null ||
        page == null) //throw Exception if query parameter is null
    {
      throw NullValueException(
          'query == null || includeAdult == null || language == null || page == null is true');
    }
    //not null parameters
    List<String> optionalQueries = [
      'query=$query',
      'includeAdult=$includeAdult',
      'language=$language',
      'page=$page'
    ];
    //null parameters
    if (region != null) {
      optionalQueries.add('region=$region');
    }

    return _v3._query('$_endPoint/multi', optionalQueries: optionalQueries);
  }

  ///Search for people.
  ///
  /// ## Parameters
  ///  `query`: Pass a text query to search. This value should be URI encoded. *minLength: 1*
  ///
  ///  `page`: Specify which page to query.
  /// *minimum: 1 maximum: 1000 default: 1*
  ///
  ///  `language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///  `include_adult`: Choose whether to inlcude adult content in the results. *default:false*
  ///
  ///  `region`: Specify a ISO 3166-1 code to filter release dates. Must be uppercase.
  ///  *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.search.queryPeople('Bradley Cooper');
  ///```
  Future<Map> queryPeople(String query,
      {bool includeAdult = false,
      String region,
      String language = 'en-US',
      int page = 1}) {
    if (query == null ||
        includeAdult == null ||
        language == null ||
        page == null) //throw Exception if query parameter is null
    {
      throw NullValueException(
          'query == null || includeAdult == null || language == null || page == null is true');
    }
    //not null parameters
    List<String> optionalQueries = [
      'query=$query',
      'includeAdult=$includeAdult',
      'language=$language',
      'page=$page'
    ];
    if (region != null) {
      optionalQueries.add('region=$region');
    }
    return _v3._query('$_endPoint/person', optionalQueries: optionalQueries);
  }

  ///Search multiple models in a single request.
  /// Multi search currently supports searching for
  /// movies, tv shows and people in a single request.
  ///
  /// ## Parameters
  ///  `query`: Pass a text query to search. This value should be URI encoded. *minLength: 1*
  ///
  ///  `page`: Specify which page to query.
  /// *minimum: 1 maximum: 1000 default: 1*
  ///
  ///  `language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///  `include_adult`: Choose whether to inlcude adult content in the results. *default:false*
  ///
  ///  `region`: Specify a ISO 3166-1 code to filter release dates. Must be uppercase.
  ///  *pattern: ^[A-Z]{2}$*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.search.queryTvShows('Sony Pictures');
  ///```
  Future<Map> queryTvShows(String query,
      {String firstAirDateYear, String language = 'en-US', int page = 1}) {
    if (query == null ||
        language == null ||
        page == null) //throw Exception if query parameter is null
    {
      throw NullValueException(
          'query == null||language==null||page==null is true');
    }
    List<String> optionalQueries = [
      'query=$query',
      'language=$language',
      'page=$page'
    ];
    if (firstAirDateYear != null) {
      optionalQueries.add('first_air_date_year=$firstAirDateYear');
    }
    return _v3._query('$_endPoint/tv', optionalQueries: optionalQueries);
  }
}
