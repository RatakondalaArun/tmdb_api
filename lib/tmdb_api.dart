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

part 'utils/tmdb_exceptions.dart';

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

///Parameters for quering
///
///takes three optional parametes.
///
///[language] default to 'en-US'
///,[page] default to '1'
///, [append] takes a list of append_to_response
class Parameters {
  ///refer to https://developers.themoviedb.org/3/getting-started/languages
  final String language;

  ///Page number
  final int page;

  ///append_to_response
  ///
  ///For more details refer to https://developers.themoviedb.org/3/getting-started/append-to-response
  final List<String> append;

  ///region
  ///
  ///For more detail refer to https://developers.themoviedb.org/3/getting-started/regions
  final String region;

  ///[language] default to 'en-US'
  ///
  ///[page] default to '1' and constrains (1=<page<=1000)
  ///
  ///[append] takes a list of append_to_response
  ///
  ///[region] takes a String of region code and it
  ///must be Uppercase and length must be less then 2
  Parameters({this.language = 'en-US', this.page = 1, this.append, this.region})
      : assert(page <= 1000 && page >= 1 && page != null),
        assert(language.length >= 2 && language != null);

  @override
  String toString() {
    return _query();
  }

  String _query() {
    List<String> query = [];
    if (language != null) query.add('language=${this.language}');
    if (page != null) query.add('page=${this.page}');
    if (region != null) query.add('region=${this.region}');
    if (append != null)
      query.add('append_to_response=${this.append.join(',')}');
    return query.join('&');
  }
}

enum HttpMethod {
  ///For get request
  GET,

  ///For post request
  POST,

  ///For Delete request
  DELETE,
}
