/// Client library for [themoviedb](https://www.themoviedb.org/)
///
/// 1) **Import it**
///     Now in your Dart code, you can use:
///
///     ```dart
///     import 'package:tmdb_api/tmdb_api.dart';
///     ```
///
/// 2) **Create Instance**
///
///     Now you need to create instance for `TMDB` and `ApiKeys` with your api keys.
///
///     ```dart
///     final tmdbWithCustomLogs = TMDB( //TMDB instance
///         ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),//ApiKeys instance with your keys,
///       );
///     ```
///
/// 3) **Configuring console logs**
///
///     There are 3 logconfigs presets avaliable.
///
///     - `ConfigLogger.showAll()`: development use.
///     - `ConfigLogger.showRecommended()`: development use.
///     - `ConfigLogger.showNone()`: production use.
///
///     You can add any off this presets to `logConfig` named parameter of `TMDB` instance
///     **Custom Logs**
///
///     ```dart
///     final tmdbWithCustomLogs = TMDB(
///         ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),
///         logConfig: ConfigLogger(
///           showLogs: true,//must be true than only all other logs will be shown
///           showErrorLogs: true,
///         ),
///       );
///     ```
///
/// ## Example
///
/// For getting Trending movies
///
/// ```dart
/// Map result = await tmdb.v3.trending.getTrending(mediaType = MediaType.all,timeWindow = TimeWindow.day);
/// ```
///
/// ## For more API documentation
///
/// visit [offical API documentation](https://developers.themoviedb.org/3/getting-started/introduction)
///
library tmdb_api;

import 'package:colorize/colorize.dart';
import 'package:dio/dio.dart';

part 'abs/catagory.dart';
part 'abs/version.dart';
part 'logger/logger.dart';
part 'models/list_item.dart';
part 'utils/api_keys.dart';
part 'utils/enums.dart';
part 'utils/tmdb_exceptions.dart';
part 'versions/v3.dart';
part 'versions/v3/category/account.dart';
part 'versions/v3/category/authentication.dart';
part 'versions/v3/category/certification.dart';
part 'versions/v3/category/changes.dart';
part 'versions/v3/category/collections.dart';
part 'versions/v3/category/companies.dart';
part 'versions/v3/category/credit.dart';
part 'versions/v3/category/discover.dart';
part 'versions/v3/category/find.dart';
part 'versions/v3/category/genres.dart';
part 'versions/v3/category/guest_session.dart';
part 'versions/v3/category/images.dart';
part 'versions/v3/category/keywords.dart';
part 'versions/v3/category/lists.dart';
part 'versions/v3/category/movies.dart';
part 'versions/v3/category/networks.dart';
part 'versions/v3/category/people.dart';
part 'versions/v3/category/reviews.dart';
part 'versions/v3/category/search.dart';
part 'versions/v3/category/trending.dart';
part 'versions/v3/category/tv.dart';
part 'versions/v3/category/tv_episode_group.dart';
part 'versions/v3/category/tv_episodes.dart';
part 'versions/v3/category/tv_seasons.dart';
part 'versions/v4.dart';
part 'versions/v4/category/account.dart';
part 'versions/v4/category/auth.dart';
part 'versions/v4/category/lists.dart';

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

  late V3 _v3;
  late V4 _v4;
  late Images _images;
  late Dio _dio;
  late Logger _logger;

  final String defaultLanguage;

  /// Creates a instance of [TMDB] client.
  ///
  /// Use [apiKeys] to provide your TMDB apikeys, you can find yours
  /// at https://www.themoviedb.org/settings/api. Provide [logConfig]
  /// to configure your logs from [TMDB] library, by default it shows none.
  /// You can provide your own [Dio] instance with [dio],
  /// which can be used for testing.
  /// caching and other dio intercepters with [interceptors].
  /// [defaultLanguage] sets a default `language` parameter to all supported
  /// methods, by default it is set to `en-US`.
  ///
  /// - [Read more about dio interceptors](https://pub.dev/packages/dio#interceptors)
  /// - [Read more about languages supported by TMDB here](https://developers.themoviedb.org/3/configuration/get-languages)
  TMDB(
    ApiKeys apiKeys, {
    ConfigLogger logConfig = const ConfigLogger.showNone(),
    Dio? dio,
    Interceptors? interceptors,
    this.defaultLanguage = 'en-US',
  }) : _apiKeys = apiKeys {
    _dio = dio ?? Dio(BaseOptions(receiveDataWhenStatusError: true));
    _dio.interceptors.addAll(interceptors ?? []);
    _v3 = V3(this);
    _v4 = V4(this);
    _images = Images();
    _logger = Logger(logConfig)..infoLog('Api initilized ✔');
  }

  Images get images => _images;

  ///Version v3 of tmdb api
  ///
  ///[offical v3 doc](https://developers.themoviedb.org/3/getting-started)
  V3 get v3 => _v3;

  /// Version v4 of tmdb api
  V4 get v4 => _v4;

  /// Closes dio client
  void close({bool force = false}) => _dio.close(force: force);
}
