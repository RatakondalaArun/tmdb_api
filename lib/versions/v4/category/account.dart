part of tmdb_api;

class AccountV4 {
  final V4 _v4;
  final String _endPoint = 'account';
  AccountV4(this._v4) : assert(_v4 != null);

  ///Get all of the lists you've created.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///## Implementation
  ///```
  /// Map result = await tmdb.v4.account.getLists(ACCESS_TOKEN,USER_TMDB_ID);
  ///```
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"total_results": 18,
  ///"total_pages": 1,
  ///"results": [
  ///  {
  ///    "iso_639_1": "en",
  ///    "id": 28,
  ///    "featured": 1,
  ///    "description": "Here's my list of best picture winners for the Oscars. Thought it would be neat to see them all together. There's a lot of movies here I have never even heard of.",
  ///    "revenue": "14218702935",
  ///    "public": 1,
  ///    "name": "Best Picture Winners - The Academy Awards",
  ///    "updated_at": "2019-04-20 16:22:46",
  ///    "created_at": "2012-11-10 21:05:00",
  ///    "sort_by": 6,
  ///    "backdrop_path": "/rgyhSn3mINvkuy9iswZK0VLqQO3.jpg",
  ///    "runtime": 12643,
  ///    "average_rating": 7.5221,
  ///    "iso_3166_1": "US",
  ///    "adult": 0,
  ///    "number_of_items": 92,
  ///    "poster_path": "/1ydP3HPsFB0aLVijHXt1obSLqlC.jpg"
  ///  },
  /// ]
  ///}
  ///```
  ///
  Future<Map> getLists(String accessToken, String accountId, {int page = 1}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/lists', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    });
  }

  ///Get the list of movies you have marked as a favorite.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: , created_at.asc,
  ///created_at.desc, release_date.asc, release_date.desc, title.asc, title.desc, vote_average.asc, vote_average.desc*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.account.getFavoritMovies(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"results": [
  ///  {
  ///    "poster_path": null,
  ///    "adult": false,
  ///    "overview": "The special bond that develops between plus-sized inflatable robot Baymax, and prodigy Hiro Hamada, who team up with a group of friends to form a band of high-tech heroes.",
  ///    "release_date": "2014-10-22",
  ///    "genre_ids": [
  ///      12,
  ///      10751,
  ///      16,
  ///      28,
  ///      35
  ///    ],
  ///    "id": 177572,
  ///    "original_title": "Big Hero 6",
  ///    "original_language": "en",
  ///    "title": "Big Hero 6",
  ///    "backdrop_path": null,
  ///    "popularity": 8.183445,
  ///    "vote_count": 1179,
  ///    "video": false,
  ///    "vote_average": 7.97
  ///  },
  /// ]
  ///}
  ///```
  ///
  Future<Map> getFavoritMovies(String accessToken, String accountId,
      {int page = 1, String sortBy = 'created_at.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/movie/favorites', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'created_at.asc'}'
    ]);
  }

  ///Get the list of TV shows you have marked as a favorite.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: ,
  ///first_air_date.asc, first_air_date.desc, name.asc, name.desc, vote_average.asc, vote_average.desc*
  ///
  ///## Implementation
  ///```
  /// Map result = await tmdb.v4.account.getFavoriteTvShows(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"results": [
  ///  {
  ///    "poster_path": null,
  ///    "popularity": 5.4,
  ///    "id": 61889,
  ///    "backdrop_path": null,
  ///    "vote_average": 7.74,
  ///    "overview": "Lawyer-by-day Matt Murdock uses his heightened senses from being blinded as a young boy to fight crime at night on the streets of Hell’s Kitchen as Daredevil.......",
  ///    "first_air_date": "2015-04-10",
  ///    "origin_country": [
  ///      "US"
  ///    ],
  ///    "genre_ids": [
  ///      28,
  ///      80
  ///    ],
  ///    "original_language": "en",
  ///    "vote_count": 19,
  ///    "name": "Marvel's Daredevil",
  ///    "original_name": "Marvel's Daredevil"
  ///  },
  /// ]
  ///}
  ///
  ///```
  ///
  Future<Map> getFavoriteTvShows(String accessToken, String accountId,
      {int page = 1, String sortBy = 'created_at.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/tv/favorites', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'created_at.asc'}'
    ]);
  }

  ///Get a list of your personal movie recommendations.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: , created_at.asc,
  /// created_at.desc, release_date.asc, release_date.desc, title.asc, title.desc, vote_average.asc, vote_average.desc*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.account.getMovieRecommendations(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///
  ///
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"results": [
  ///  {
  ///    "poster_path": null,
  ///    "adult": false,
  ///    "overview": "The special bond that develops between plus-sized inflatable robot Baymax, and prodigy Hiro Hamada, who team up with a group of friends to form a band of high-tech heroes.",
  ///    "release_date": "2014-10-22",
  ///    "genre_ids": [
  ///      12,
  ///      10751,
  ///      16,
  ///      28,
  ///      35
  ///    ],
  ///    "id": 177572,
  ///    "original_title": "Big Hero 6",
  ///    "original_language": "en",
  ///    "title": "Big Hero 6",
  ///    "backdrop_path": null,
  ///    "popularity": 8.183445,
  ///    "vote_count": 1179,
  ///    "video": false,
  ///    "vote_average": 7.97
  ///   },
  /// ]
  ///}
  ///
  ///```
  ///
  Future<Map> getMovieRecommendations(String accessToken, String accountId,
      {int page = 1, String sortBy = 'created_at.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4
        ._query('$_endPoint/$accountId/movie/recommendations', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'created_at.asc'}'
    ]);
  }

  ///Get a list of your personal TV show recommendations.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: , first_air_date.asc, first_air_date.desc,
  ///name.asc, name.desc, vote_average.asc, vote_average.desc, release_date.asc, release_date.desc, title.asc, title.desc*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.account.getTvShowRecommendations(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///
  ///
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"results": [
  ///  {
  ///    "poster_path": null,
  ///    "popularity": 5.4,
  ///    "id": 61889,
  ///    "backdrop_path": null,
  ///    "vote_average": 7.74,
  ///    "overview": "Lawyer-by-day Matt Murdock uses his heightened senses from being blinded as a young boy to fight crime at night on the streets of Hell’s Kitchen as Daredevil.......",
  ///    "first_air_date": "2015-04-10",
  ///    "origin_country": [
  ///      "US"
  ///    ],
  ///    "genre_ids": [
  ///      28,
  ///      80
  ///    ],
  ///    "original_language": "en",
  ///    "vote_count": 19,
  ///    "name": "Marvel's Daredevil",
  ///    "original_name": "Marvel's Daredevil"
  ///  },
  /// ]
  ///}
  ///```
  Future<Map> getTvShowRecommendations(String accessToken, String accountId,
      {int page = 1, String sortBy = 'first_air_date.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/tv/recommendations', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'first_air_date.asc'}'
    ]);
  }

  ///Get the list of movies you have added to your watchlist.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: created_at.asc,
  ///created_at.desc, release_date.asc, release_date.desc, title.asc, title.desc, vote_average.asc, vote_average.desc*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.account.getMovieWatchList(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///
  ///
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"results": [
  ///  {
  ///    "poster_path": null,
  ///    "popularity": 5.4,
  ///    "id": 61889,
  ///    "backdrop_path": null,
  ///    "vote_average": 7.74,
  ///    "overview": "Lawyer-by-day Matt Murdock uses his heightened senses from being blinded as a young boy to fight crime at night on the streets of Hell’s Kitchen as Daredevil.......",
  ///    "first_air_date": "2015-04-10",
  ///    "origin_country": [
  ///      "US"
  ///    ],
  ///    "genre_ids": [
  ///      28,
  ///      80
  ///    ],
  ///    "original_language": "en",
  ///    "vote_count": 19,
  ///    "name": "Marvel's Daredevil",
  ///    "original_name": "Marvel's Daredevil"
  ///  },
  /// ]
  ///}
  ///```
  Future<Map> getMovieWatchList(String accessToken, String accountId,
      {int page = 1, String sortBy = 'created_at.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/movie/watchlist', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'created_at.asc'}'
    ]);
  }

  ///Get the list of TV shows you have added to your watchlist.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: , first_air_date.asc,
  ///first_air_date.desc, name.asc, name.desc, vote_average.asc, vote_average.desc*
  ///
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.account.getTvShowWatchList(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///
  ///
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"results": [
  ///  {
  ///    "poster_path": null,
  ///    "popularity": 2.08745,
  ///    "id": 1412,
  ///    "backdrop_path": null,
  ///    "vote_average": 7.84,
  ///    "overview": "Arrow is an American action adventure television series that follows billionaire playboy Oliver Queen, portrayed by Stephen Amell, who, after five years of being stranded on a hostile island, returns home to fight crime and corruption as a secret vigilante whose weapon of choice is a bow and arrows. Arrow will also feature appearances by other DC Comics characters. To assist in promotion, a preview comic book was released to tie into the television series.",
  ///    "first_air_date": "2012-10-10",
  ///    "origin_country": [
  ///      "US",
  ///      "CA"
  ///    ],
  ///    "genre_ids": [
  ///      28,
  ///      12,
  ///      80,
  ///      18,
  ///      9648,
  ///      878
  ///    ],
  ///    "original_language": "en",
  ///    "vote_count": 97,
  ///    "name": "Arrow",
  ///    "original_name": "Arrow"
  ///   },
  /// ]
  ///}
  ///```
  Future<Map> getTvShowWatchList(String accessToken, String accountId,
      {int page = 1, String sortBy = 'first_air_date.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/tv/watchlist', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'first_air_date.asc'}'
    ]);
  }

  ///Get the list of TV shows you have added to your watchlist.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: , created_at.asc, created_at.desc,
  ///release_date.asc, release_date.desc, title.asc, title.desc, vote_average.asc, vote_average.desc*
  ///
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.account.getRatedMovies(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///
  ///
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"total_results": 731,
  ///"total_pages": 15,
  ///"results": [
  ///  {
  ///    "account_rating": {
  ///      "value": 8,
  ///      "created_at": "2017-07-28T04:55:40.898Z"
  ///    },
  ///    "popularity": 37.863186,
  ///    "vote_count": 1331,
  ///    "video": false,
  ///    "poster_path": "/cUqEgoP6kj8ykfNjJx3Tl5zHCcN.jpg",
  ///    "id": 374720,
  ///    "adult": false,
  ///    "backdrop_path": "/fudEG1VUWuOqleXv6NwCExK0VLy.jpg",
  ///    "original_language": "en",
  ///    "original_title": "Dunkirk",
  ///    "genre_ids": [
  ///      28,
  ///      18,
  ///      36,
  ///      53,
  ///      10752
  ///    ],
  ///    "title": "Dunkirk",
  ///    "vote_average": 7.4,
  ///    "overview": "Miraculous evacuation of Allied soldiers from Belgium, Britain, Canada, and France, who were cut off and surrounded by the German army from the beaches and harbor of Dunkirk, France, between May 26 and June 04, 1940, during Battle of France in World War II.",
  ///    "release_date": "2017-07-19"
  ///  },
  /// ]
  ///}
  ///```
  Future<Map> getRatedMovies(String accessToken, String accountId,
      {int page = 1, String sortBy = 'created_at.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/movie/rated', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'created_at.asc'}'
    ]);
  }

  ///Get the list of TV shows you have added to your watchlist.
  ///
  ///## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `accountId`: id of the user account
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `sortListBy`:Choose a sort option for the list of results. *Allowed Values: , first_air_date.asc,
  ///first_air_date.desc, name.asc, name.desc, vote_average.asc, vote_average.desc*
  ///
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.account.getRatedTvShows(ACCESS_TOKEN, USER_TMDB_ID);
  ///```
  ///
  ///
  ///## Result
  ///```
  ///{
  ///"page": 1,
  ///"total_results": 183,
  ///"total_pages": 10,
  ///"results": [
  ///  {
  ///    "original_name": "Brooklyn Nine-Nine",
  ///    "genre_ids": [
  ///      35,
  ///      80
  ///    ],
  ///    "account_rating": {
  ///      "value": 10,
  ///      "created_at": "2017-08-18T02:10:50.029Z"
  ///    },
  ///    "name": "Brooklyn Nine-Nine",
  ///    "popularity": 12.442095,
  ///    "origin_country": [
  ///      "US"
  ///    ],
  ///    "vote_count": 242,
  ///    "first_air_date": "2013-09-17",
  ///    "backdrop_path": "/keRjfnXlqcClmKF613lYnZLM9sJ.jpg",
  ///    "original_language": "en",
  ///    "id": 48891,
  ///    "vote_average": 7.3,
  ///    "overview": "A single-camera ensemble comedy following the lives of an eclectic group of detectives in a New York precinct, including one slacker who is forced to shape up when he gets a new boss.",
  ///    "poster_path": "/o40Wv2cCxbUUpBoDa7imlLE05mB.jpg"
  ///  },
  /// ]
  ///}
  ///```
  Future<Map> getRatedTvShows(String accessToken, String accountId,
      {int page = 1, String sortBy = 'first_air_date.asc'}) {
    if (accessToken == null || accountId == null || page == null)
      throw NullValueException(
          'accessToken == null || accountId == null || page == null is true');
    if (page < 1 || page > 1000)
      throw InvalidDataException('page < 1 || page > 1000 is true');

    return _v4._query('$_endPoint/$accountId/tv/rated', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'sort_by=${sortBy ?? 'first_air_date.asc'}'
    ]);
  }
}
