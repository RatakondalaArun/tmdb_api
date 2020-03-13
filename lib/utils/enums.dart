part of tmdb_api;

//-------------------tmdb_api---------------------
///Http request methods
enum HttpMethod {
  ///For get request
  GET,

  ///For post request
  POST,

  ///For Delete request
  DELETE,
}

//----------------------others-------------------------

enum MediaType {
  ///To get all movies,tv,person
  all,

  ///filter the result with only movies
  movie,

  ///filter the result with only tv shows
  tv,

  ///filter the result with only persons
  person
}

enum TimeWindow { day, week }

///Sort the results.
enum SortBy { createdAtAsc, createdAtDes }

//movies.dart
enum SortMoviesBy {
  popularityAsc,
  popularityDesc,
  releaseDateAsc,
  releaseDateDesc,
  revenueAsc,
  revenueDesc,
  primaryReleaseDateAsc,
  primaryReleaseDateDesc,
  orginalTitleAsc,
  orginalTitleDesc,
  voteAverageAsc,
  voteAverageDesc,
  voteCountAsc,
  voteCountDesc
}

//movies.dart
enum SortTvShowsBy {
  voteAverageAsc,
  voteAverageDesc,
  popularityAsc,
  popularityDesc,
  firstAirDateAsc,
  firstAirDateDesc
}

//find.dart
enum ExternalId { imdbId, tvdbId, facebookId, twitterId, instagramId }
