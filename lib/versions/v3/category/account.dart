part of tmdb_api;

class Account extends Category<V3> {
  Account(V3 v) : super(v, 'account');

  ///Get your account details.
  ///
  ///For doc [visit](https://developers.themoviedb.org/3/account/get-account-details)
  ///
  ///## Parameters
  ///`sessonId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///## Implementation
  ///```
  /// Map result = await tmdb.v3.account.getDetails('5129b38561c99f577bd85cc7f2ff47bb79735902');
  /// ```
  ///## Result
  ///```
  ///{
  ///   avatar: {
  ///     gravatar: {
  ///       hash: edbe4416c7bfb6f84ae0b4a4d201421d
  ///     }
  ///    },
  ///   id: 8890102,
  ///   iso_639_1: en,
  ///   iso_3166_1: US,
  ///   name: ,
  ///   include_adult: false,
  ///   username: hello
  ///}
  ///```
  Future<Map> getDetails(String sessionId) {
    return _v._query('$_endPoint', optionalQueries: ['session_id=$sessionId']);
  }

  ///Get all of the lists created by an account.
  ///Will invlude private lists if you are the owner.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`:Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getCreatedLists('5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///
  ///## Result
  ///```
  ///{
  /// page: 1,
  /// results: [
  ///   {
  ///     description: lol move time,
  ///     favorite_count: 0, id: 134719,
  ///     item_count: 0,
  ///     iso_639_1: en,
  ///     list_type: movie,
  ///     name: testing this api,
  ///     poster_path: null
  ///   },
  ///   {
  ///     description: somefaas test,
  ///     favorite_count: 0,
  ///     id: 134718,
  ///     item_count: 0,
  ///     iso_639_1: en,
  ///     list_type: movie,
  ///     name: cool test,
  ///     poster_path: null
  ///   }],
  /// total_pages: 1,
  /// total_results: 2
  ///}
  ///```
  ///
  Future<Map> getCreatedLists(String sessionId, int accountId,
      {String language = 'en-US', int page = 1}) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }

    return _v._query('$_endPoint/$accountId/lists', optionalQueries: [
      'session_id=$sessionId',
      'language=$language',
      'page=$page'
    ]);
  }

  ///Get the list of your favorite movies.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getFavoriteMovies(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///## Result
  ///```
  ///{
  /// page: 1,
  /// results: [],
  /// total_pages: 0,
  /// total_results: 0
  ///}
  ///```
  Future<Map> getFavoriteMovies(
    String sessionId,
    int accountId, {
    String language = 'en-US',
    int page = 1,
    SortBy sortBy = SortBy.createdAtAsc,
  }) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }
    String sort;
    if (sortBy == SortBy.createdAtAsc) {
      sort = 'created_at.asc';
    } else {
      sort = 'created_at.desc';
    }
    return _v._query('$_endPoint/$accountId/favorite/movies', optionalQueries: [
      'session_id=$sessionId',
      'language=$language',
      'page=$page',
      'sort_by=$sort'
    ]);
  }

  ///Get the list of your favorite tv.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getFavoriteTvShows(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///## Result
  ///```
  ///{
  /// page: 1,
  /// results: [],
  /// total_pages: 0,
  /// total_results: 0
  ///}
  ///```
  Future<Map> getFavoriteTvShows(String sessionId, int accountId,
      {String language = 'en-US',
      int page = 1,
      SortBy sortBy = SortBy.createdAtAsc}) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }
    String sort;
    if (sortBy == SortBy.createdAtAsc) {
      sort = 'created_at.asc';
    } else {
      sort = 'created_at.desc';
    }

    return _v._query('$_endPoint/$accountId/favorite/tv', optionalQueries: [
      'session_id=$sessionId',
      'language=$language',
      'page=$page',
      'sort_by=$sort'
    ]);
  }

  ///This method allows you to mark a movie or TV show as a favorite item.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`mediaType`: tv show or movie. Allowed Values: MediaType.movie, MediaType.tv
  /// *default: SortBy.createdAtAsc*
  ///
  /// `isFavorite`: true marks the movie or tv as fav and false unmarks it. *defalut:true*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.markAsFavorite(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id',550);
  ///```
  ///## Result
  ///```
  ///{
  /// status_code: 12,
  /// status_message: The item/record was updated successfully.
  ///}
  ///```
  Future<Map> markAsFavorite(
      String sessionId, int accountId, int mediaId, MediaType mediaType,
      {bool isFavorite = true}) {
    if (accountId < 1 || mediaId < 1) {
      throw ArgumentError('accountId<1||mediaId<1 is true');
    }
    String type;
    //
    if (mediaType == MediaType.tv) {
      type = 'tv';
    } else {
      type = 'movie';
    }

    return _v._query('$_endPoint/$accountId/favorite',
        method: HttpMethod.post,
        optionalQueries: [
          'session_id=$sessionId'
        ],
        postBody: {
          'media_type': type,
          'media_id': '$mediaId',
          'favorite': '$isFavorite'
        });
  }

  ///Get a list of all the movies you have rated.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getRatedMovies(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///## Result
  ///```
  ///{
  /// status_code: 12,
  /// status_message: The item/record was updated successfully.
  ///}
  ///```
  Future<Map> getRatedMovies(String sessionId, int accountId,
      {String language = 'en-US',
      int page = 1,
      SortBy sortBy = SortBy.createdAtAsc}) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }
    String sort;
    if (sortBy == SortBy.createdAtAsc) {
      sort = 'created_at.asc';
    } else {
      sort = 'created_at.desc';
    }

    return _v._query('$_endPoint/$accountId/rated/movies', optionalQueries: [
      'session_id=$sessionId',
      'language=$language',
      'page=$page',
      'sort_by=$sort'
    ]);
  }

  ///Get a list of all the tv you have rated.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getRatedShows(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///## Result
  ///{
  /// page: 1,
  /// results: [
  ///     {
  ///       original_name: Han Wu Da Di,
  ///       genre_ids: [],
  ///       name: Han Wu Da Di,
  ///       vote_count: 2,
  ///       original_language: en,
  ///       vote_average: 6.8,
  ///       poster_path: /sg6tjBKBu62mC9uj2CJPoP0Zl2M.jpg,
  ///       id: 12,
  ///       backdrop_path: /x1Ml2ApDDAh67z9akERhoRyZ2vM.jpg,
  ///       overview: Han Wu Da Di, also released under the title The Emperor Han Wu in some countries, is a 2005 Chinese television series about the life of Emperor Wu of the Han Dynasty, and is based on the historical texts Records of the Grand Historian and Book of Han.,
  ///       origin_country: [CN],
  ///       popularity: 0.673,
  ///       rating: 5.0
  ///     }],
  /// total_pages: 1,
  /// total_results: 1
  ///}
  Future<Map> getRatedTvShows(String sessionId, int accountId,
      {String language = 'en-US',
      int page = 1,
      SortBy sortBy = SortBy.createdAtAsc}) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }
    String sort;
    if (sortBy == SortBy.createdAtAsc) {
      sort = 'created_at.asc';
    } else {
      sort = 'created_at.desc';
    }

    return _v._query('$_endPoint/$accountId/rated/tv', optionalQueries: [
      'session_id=$sessionId',
      'language=$language',
      'page=$page',
      'sort_by=$sort'
    ]);
  }

  ///Get a list of all the TV episodes you have rated.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getTvEpisodes(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///## Result
  ///```
  ///{
  /// page: 1,
  /// results: [],
  /// total_pages: 0,
  /// total_results: 0
  ///}
  ///```
  Future<Map> getRatedTvEpisodes(String sessionId, int accountId,
      {String language = 'en-US',
      int page = 1,
      SortBy sortBy = SortBy.createdAtAsc}) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }
    String sort;
    if (sortBy == SortBy.createdAtAsc) {
      sort = 'created_at.asc';
    } else {
      sort = 'created_at.desc';
    }

    return _v._query('$_endPoint/$accountId/rated/tv/episodes',
        optionalQueries: [
          'session_id=$sessionId',
          'language=$language',
          'page=$page',
          'sort_by=$sort'
        ]);
  }

  ///Get a list of all the movies you have added to your watchlist.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getRatedMovies(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///## Result
  ///```
  ///  {
  ///  "page": 1,
  ///  "results": [
  ///    {
  ///      "adult": false,
  ///      "backdrop_path": null,
  ///      "genre_ids": [
  ///        18
  ///      ],
  ///      "id": 76726,
  ///      "original_language": "it",
  ///      "original_title": "Chronicle",
  ///      "overview": "Three high school students make an incredible discovery, leading to their developing uncanny powers beyond their understanding. As they learn to control their abilities and use them to their advantage, their lives start to spin out of control, and their darker sides begin to take over.",
  ///      "release_date": "2012-02-02",
  ///      "poster_path": null,
  ///      "popularity": 0.237951,
  ///      "title": "Chronicle",
  ///      "video": false,
  ///      "vote_average": 6.2,
  ///      "vote_count": 545
  ///    }
  ///  ],
  ///  "total_pages": 14,
  ///  "total_results": 277
  ///}
  ///```
  Future<Map> getMovieWatchList(String sessionId, int accountId,
      {String language = 'en-US',
      int page = 1,
      SortBy sortBy = SortBy.createdAtAsc}) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }
    String sort;
    if (sortBy == SortBy.createdAtAsc) {
      sort = 'created_at.asc';
    } else {
      sort = 'created_at.desc';
    }

    return _v._query('$_endPoint/$accountId/watchlist/movies',
        optionalQueries: [
          'session_id=$sessionId',
          'language=$language',
          'page=$page',
          'sort_by=$sort'
        ]);
  }

  ///Get a list of all the TV shows you have added to your watchlist.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`sortBy`: Sort the results. Allowed Values: created_at.asc, created_at.desc
  /// *default: SortBy.createdAtAsc*
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.getRatedMovies(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id');
  ///```
  ///## Result
  ///```
  ///  {
  ///  "page": 1,
  ///  "results": [
  ///    {
  ///      "backdrop_path": null,
  ///      "first_air_date": "2013-09-26",
  ///      "genre_ids": [
  ///        35
  ///      ],
  ///      "id": 58932,
  ///      "original_language": "en",
  ///      "original_name": "The Crazy Ones",
  ///      "overview": "The Crazy Ones is an American situation comedy series created by David E. Kelley that stars Robin Williams and Sarah Michelle Gellar. The single-camera project premiered on CBS on September 26, 2013, as part of the 2013–14 American television season as a Thursday night 9 pm entry. Bill D'Elia, Dean Lorey, Jason Winer, John Montgomery and Mark Teitelbaum serve as executive producers for 20th Century Fox Television.",
  ///      "origin_country": [
  ///        "US"
  ///      ],
  ///      "poster_path": null,
  ///      "popularity": 0.075407,
  ///      "name": "The Crazy Ones",
  ///      "vote_average": 5.3,
  ///      "vote_count": 4
  ///    }
  ///  ],
  ///  "total_pages": 4,
  ///  "total_results": 64
  ///}
  ///```
  Future<Map> getTvShowWatchList(String sessionId, int accountId,
      {String language = 'en-US',
      int page = 1,
      SortBy sortBy = SortBy.createdAtAsc}) {
    if (accountId < 1 || page < 1 || page > 1000) {
      throw ArgumentError('accountId < 1 || page < 1 || page > 1000 is true');
    }
    String sort;
    if (sortBy == SortBy.createdAtAsc) {
      sort = 'created_at.asc';
    } else {
      sort = 'created_at.desc';
    }

    return _v._query('$_endPoint/$accountId/watchlist/tv', optionalQueries: [
      'session_id=$sessionId',
      'language=$language',
      'page=$page',
      'sort_by=$sort'
    ]);
  }

  ///Add a movie or TV show to your watchlist.
  ///
  ///## Parameters
  ///`sessionId`: current session id you can generate one using ``` tmdb.v3.auth.```
  ///
  ///`accountId`: current user id *889*****
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///`page`: Specify which page to query.
  ///*minimum: 1 maximum: 1000 default: 1*
  ///
  ///`mediaType`: tv show or movie. Allowed Values: MediaType.movie, MediaType.tv
  /// *default: SortBy.createdAtAsc*
  ///
  /// `shouldAdd`: true to add this move false to remove. *defalut:true*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.account.markAsFavorite(
  /// '5129b38561c99f577bd85cc7f2ff47bb79735902', 'user id',550);
  ///```
  ///## Result
  ///```
  ///{
  /// status_code: 12,
  /// status_message: The item/record was updated successfully.
  ///}
  ///```
  Future<Map> addToWatchList(
      String sessionId, int accountId, int mediaId, MediaType mediaType,
      {bool shouldAdd = true}) {
    if (accountId < 1 || mediaId < 1) {
      throw ArgumentError('accountId<1||mediaId<1 is true');
    }
    String type;
    //
    if (mediaType == MediaType.tv) {
      type = 'tv';
    } else {
      type = 'movie';
    }

    return _v._query('$_endPoint/$accountId/watchlist',
        method: HttpMethod.post,
        optionalQueries: [
          'session_id=$sessionId'
        ],
        postBody: {
          'media_type': '$type',
          'media_id': '$mediaId',
          'watchlist': '$shouldAdd'
        });
  }
}
