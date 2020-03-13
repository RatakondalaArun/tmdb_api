library tmdb_api;

import 'dart:convert';
import 'package:http/http.dart' as http;

part 'versions/v3.dart';
part 'category/movies.dart';
part 'category/tv.dart';
part 'category/tv_seasons.dart';
part 'category/tv_episodes.dart';
part 'category/tv_episode_group.dart';
part 'category/people.dart';
part 'category/credit.dart';
part 'category/certification.dart';
part 'category/changes.dart';
part 'category/collections.dart';
part 'category/find.dart';
part 'category/genres.dart';
part 'category/keywords.dart';
part 'category/companies.dart';
part 'category/trending.dart';
part 'category/search.dart';
part 'category/discover.dart';
part 'category/networks.dart';
part 'category/reviews.dart';
part 'category/authentication.dart';
part 'category/lists.dart';
part 'category/images.dart';
part 'category/account.dart';

part 'utils/tmdb_exceptions.dart';
part 'utils/enums.dart';

/// TMDB.org API
///
///Getting started:
///
/// To register for an API key, visit https://www.themoviedb.org/settings/api
///
class TMDB {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey;

  V3 _v3;
  Images _images;

  ///Version v3 of tmdb api
  ///
  ///[offical v3 doc](https://developers.themoviedb.org/3/getting-started)
  V3 get v3 => _v3;
  Images get images => _images;

  ///Takes a not null [apikey]
  TMDB(this._apiKey) : assert(_apiKey != null) {
    _v3 = V3(this);
    _images = Images();
  }
}
