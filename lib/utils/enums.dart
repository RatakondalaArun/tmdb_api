part of '../tmdb_api.dart';

//-------------------tmdb_api---------------------
///Http request methods
enum HttpMethod {
  ///For get request
  get,

  ///For post request
  post,

  ///For Delete request
  delete,

  ///For Put request
  put,
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
enum SortTvShowsBy { voteAverageAsc, voteAverageDesc, popularityAsc, popularityDesc, firstAirDateAsc, firstAirDateDesc }

enum FilterTvShowsByStatus { returningSeries, planned, inProduction, ended, cancelled, pilot }

enum FilterTvShowsByType {
  documentary,
  news,
  miniseries,
  reality,
  scripted,
  talkShow,
  video,
}

//find.dart
enum ExternalId { imdbId, tvdbId, facebookId, twitterId, instagramId }

//--------------------------------------V4-------------------------------------

///- lists.Dart
///
///- account.dart
enum SortListBy {
  releaseDateAsc,
  releaseDateDesc,
  orginalOrderAsc,
  orginalOrderDesc,
  voteAverageAsc,
  voteAverageDesc,
  titleAsc,
  titleDesc,
}
