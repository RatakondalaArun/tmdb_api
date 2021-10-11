part of tmdb_api;

class V3 extends Version {
  Movies? _movies;
  Tv? _tv;
  TvSeasons? _tvSeasons;
  TvEpisodes? _tvEpisodes;
  // TvEpisodeGroup _tvEpisodeGroup;
  People? _people;
  Credit? _credit;
  Certification? _certification;
  Changes? _changes;
  Collections? _collections;
  Find? _find;
  Geners? _geners;
  Keywords? _keywords;
  Companies? _companies;
  Trending? _trending;
  Search? _search;
  Discover? _discover;
  Networks? _networks;
  Reviews? _reviews;
  Auth? _auth;
  Lists? _lists;
  Account? _account;
  GuestSession? _guestSession;

  Movies get movies => _movies!;
  Tv get tv => _tv!;
  TvSeasons get tvSeasons => _tvSeasons!;
  TvEpisodes get tvEpisodes => _tvEpisodes!;
  // TvEpisodeGroup get tvEpisodeGroup => _tvEpisodeGroup;
  People get people => _people!;
  Credit get credit => _credit!;
  Certification get certification => _certification!;
  Changes get changes => _changes!;
  Collections get collections => _collections!;
  Find get find => _find!;
  Geners get geners => _geners!;
  Keywords get keywords => _keywords!;
  Companies get companies => _companies!;
  Trending get trending => _trending!;
  Search get search => _search!;
  Discover get discover => _discover!;
  Networks get networks => _networks!;
  Reviews get reviews => _reviews!;
  Auth get auth => _auth!;
  Lists get lists => _lists!;
  Account get account => _account!;
  GuestSession get guestSession => _guestSession!;

  V3(TMDB tmdb) : super(tmdb, 3) {
    _reviews = Reviews(this);
    _tv = Tv(this);
    _movies = Movies(this);
    _tvSeasons = TvSeasons(this);
    _tvEpisodes = TvEpisodes(this);
    // _tvEpisodeGroup = TvEpisodeGroup(this);
    _people = People(this);
    _credit = Credit(this);
    _certification = Certification(this);
    _changes = Changes(this);
    _collections = Collections(this);
    _find = Find(this);
    _geners = Geners(this);
    _keywords = Keywords(this);
    _companies = Companies(this);
    _trending = Trending(this);
    _search = Search(this);
    _discover = Discover(this);
    _networks = Networks(this);
    _auth = Auth(this);
    _lists = Lists(this);
    _account = Account(this);
    _guestSession = GuestSession(this);
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
    Map<String, String>? postBody,
    Map<String, String>? deleteBody,
    Map<String, String>? postHeaders,
  }) async {
    var query = 'api_key=${_tmdb._apiKeys._apiKeyV3}';
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
        response = await http.post(url, body: postBody);
      } else if (method == HttpMethod.delete) {
        response = await _httpDelete(url, deleteBody!);
      } else {
        response = await http.get(url);
      }
      return jsonDecode(response.body)! as Map;
    } catch (e) {
      Logger(_tmdb.logConfig).logTypes.errorLog(
            'Exception while making a request. Exception = {${e.toString()}',
          );
      Logger(_tmdb.logConfig).logTypes.infoLog(
            'You can create a issue at https://github.com/RatakondalaArun/tmdb_api/issues',
          );
      //if error is unknown rethrow it
      rethrow;
    }
  }

  String _optionalQueries(List<String>? queries, String currentQuery) {
    return (queries == null || queries.isEmpty)
        ? currentQuery
        : '$currentQuery&${queries.join('&')}';
  }

  //http.delete doesn't provide a body
  //so created this
  Future<http.Response> _httpDelete(
    Uri url,
    Map<String, String> deleteBody,
  ) async {
    final request = http.Request('DELETE', Uri.parse(url.toString()))
      ..headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    request.bodyFields = deleteBody;

    final response = await http.Response.fromStream(await request.send());
    return response;
  }
}
