library tmdb_api;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:colorize/colorize.dart';

part 'logger/logger.dart';

part 'versions/v3.dart';
part 'versions/v4.dart';

part 'versions/v3/category/movies.dart';
part 'versions/v3/category/tv.dart';
part 'versions/v3/category/tv_seasons.dart';
part 'versions/v3/category/tv_episodes.dart';
part 'versions/v3/category/tv_episode_group.dart';
part 'versions/v3/category/people.dart';
part 'versions/v3/category/credit.dart';
part 'versions/v3/category/certification.dart';
part 'versions/v3/category/changes.dart';
part 'versions/v3/category/collections.dart';
part 'versions/v3/category/find.dart';
part 'versions/v3/category/genres.dart';
part 'versions/v3/category/keywords.dart';
part 'versions/v3/category/companies.dart';
part 'versions/v3/category/trending.dart';
part 'versions/v3/category/search.dart';
part 'versions/v3/category/discover.dart';
part 'versions/v3/category/networks.dart';
part 'versions/v3/category/reviews.dart';
part 'versions/v3/category/authentication.dart';
part 'versions/v3/category/lists.dart';
part 'versions/v3/category/images.dart';
part 'versions/v3/category/account.dart';
part 'versions/v3/category/guest_session.dart';
part 'versions/v4/category/account.dart';
part 'versions/v4/category/auth.dart';
part 'versions/v4/category/lists.dart';

part 'utils/tmdb_exceptions.dart';
part 'utils/enums.dart';
part 'utils/ApiKeys.dart';

part 'models/ListItem.dart';

/// TMDB.org API
/// ## Usage
/// Core instance to make API calls
///
/// To register for an API key, [visit🔗](https://www.themoviedb.org/settings/api)
/// ## Parameters
///- `apiKeys`*(Positioned:1)* : this must not be null `ApiKeys`
///
///- `logConfig` *(optional)* : want some console logs from tmdb_api than provide a `ConfigLogger`.*default:false*
///
/// ## Example
/// ```
/// TMDB tmdb = TMDB(
///   ApiKeys('Your v3 API KEY', 'Your v4 API ReadAccessToken'),//pass your api keys
///   logConfig: ConfigLogger.showAll(),//configure your console logs settings
/// );
///
/// ```
///
///## For issues,feature request create a issue in [Git repo🔗](https://github.com/Arunnaidu3470/tmdb_api/issues)
class TMDB {
  final String _baseUrl = 'api.themoviedb.org';
  final ApiKeys _apiKeys;

  V3 _v3;
  V4 _v4;
  Images _images;
  ConfigLogger logConfig;

  ///Version v3 of tmdb api
  ///
  ///[offical v3 doc](https://developers.themoviedb.org/3/getting-started)
  V3 get v3 => _v3;
  V4 get v4 => _v4;
  Images get images => _images;

  ///Takes a not null [apikey]
  TMDB(this._apiKeys, {this.logConfig}) : assert(_apiKeys != null) {
    _v3 = V3(this);
    _v4 = V4(this);
    _images = Images();
    this.logConfig = logConfig ?? ConfigLogger.showNone();
    Logger(this.logConfig).logTypes.infoLog('Api initilized ✔');
  }
}
