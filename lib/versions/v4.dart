part of tmdb_api;

class V4 extends Version {
  AccountV4? _accountV4;
  AuthV4? _authV4;
  ListsV4? _listsV4;

  AccountV4 get account => _accountV4!;
  AuthV4 get auth => _authV4!;
  ListsV4 get lists => _listsV4!;

  V4(TMDB tmdb) : super(tmdb, 4) {
    _accountV4 = AccountV4(this);
    _authV4 = AuthV4(this);
    _listsV4 = ListsV4(this);
  }

  ///Queries with the given parameters
  ///
  ///by default method type is [HttpMethod.get]
  ///Queries with the given parameters
  ///
  ///by default method type is [HttpMethod.get]
  Future<Map> _query(
    String endPoint, {
    HttpMethod method = HttpMethod.get,
    List<String>? optionalQueries,
    Map<String, dynamic>? postBody,
    Map<String, String>? deleteHeaders,
    Map<String, dynamic>? deleteBody,
    Map<String, String>? postHeaders,
  }) async {
    var query = 'api_key=${_tmdb._apiKeys._apiReadAccessTokenv4}';
    query = _optionalQueries(optionalQueries, query);

    //constructing the url
    final url = Uri(
      scheme: 'https',
      host: _tmdb._baseUrl,
      path: '$_apiVersion/$endPoint',
      query: query,
    );

    //log to console
    Logger(_tmdb.logConfig).logTypes.urlLog(url.toString());

    //getting data form url
    try {
      http.Response response;
      if (method == HttpMethod.post) {
        //POST request
        response = await http.post(url,
            body: jsonEncode(postBody), headers: postHeaders);
      } else if (method == HttpMethod.delete) {
        //DELETE request
        response = await _httpDelete(url, deleteBody, deleteHeaders);
      } else if (method == HttpMethod.put) {
        //PUT request
        response = await http.put(url,
            body: jsonEncode(postBody), headers: postHeaders);
      } else {
        //GET request
        if (postHeaders != null) {
          response = await http.get(url, headers: postHeaders);
        } else {
          response = await http.get(url);
        }
      }
      return jsonDecode(response.body)! as Map;
    } catch (e) {
      Logger(_tmdb.logConfig).logTypes.errorLog(
          'Exception while making a request. Exception = {${e.toString()}');
      Logger(_tmdb.logConfig).logTypes.infoLog(
          'You can create a issue at https://github.com/RatakondalaArun/tmdb_api/issues');
      //if error is unknown rethrow it
      rethrow;
    }
  }

  String _optionalQueries(List<String>? queries, String currentQuery) {
    return (queries == null || queries.isEmpty)
        ? currentQuery
        : currentQuery + '&' + queries.join('&');
  }

  //http.delete doesn't provide a body
  //so created this
  Future<http.Response> _httpDelete(Uri url, Map<String, dynamic>? deleteBody,
      Map<String, String>? deleteHeaders) async {
    try {
      final request = http.Request('DELETE', Uri.parse(url.toString()))
        ..headers.addAll(deleteHeaders ??
            {'Content-Type': 'application/x-www-form-urlencoded'});
      // request.bodyFields = deleteBody;
      request.body = jsonEncode(deleteBody);

      final response = await http.Response.fromStream(await request.send());
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
