library tmdb_api;

import 'dart:convert';
import 'package:http/http.dart' as http;

part 'category/movies.dart';

/// TMDB.org API
///
///Getting started:
///
/// To register for an API key, visit https://www.themoviedb.org/settings/api
///
class TMDB {
  final String _baseUrl = 'api.themoviedb.org';
  final int _apiVersion = 3;
  final String _apiKey;
  // final bool _shouldUseHttps;

  Movies _movies;

  Movies get movies => _movies;

  ///Takes a not null [apikey]
  TMDB(this._apiKey) : assert(_apiKey != null) {
    _movies = Movies(this);
  }

  ///Queries with the given parameters
  ///
  ///by default method type is [HttpMethod.GET]
  Future<Map> _query(String endPoint,
      {Parameters parameters, HttpMethod method = HttpMethod.GET}) async {
    String query = (parameters == null)
        ? 'api_key=$_apiKey' //if parameters are null
        : 'api_key=$_apiKey' + '&${parameters?.toString()}'; //

    //constructing the url
    Uri url = Uri(
      scheme: 'https',
      host: _baseUrl,
      path: '$_apiVersion/$endPoint',
      query: query,
    );

    print('final url= ' + url.toString());
    http.Response response;

    //getting data form url
    try {
      if (method == HttpMethod.POST) {
        response = await http.post(url);
      } else {
        response = await http.get(url);
      }
    } catch (e) {
      print(e);
      //todo:implement exception
    }

    Map data = jsonDecode(response.body);
    // print(data);
    return data;
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

  ///[language] default to 'en-US'
  ///
  ///[page] default to '1' and constrains (1=<page<=1000)
  ///
  ///[append] takes a list of append_to_response
  Parameters({this.language = 'en-US', this.page = 1, this.append})
      : assert(page <= 1000 && page >= 1 && page != null),
        assert(language.length >= 2 && language != null);

  @override
  String toString() {
    if (append != null) {
      String appendTo = append.join(',');
      return 'language=$language&page=$page&append_to_response=$appendTo';
    } else {
      return 'language=$language&page=$page';
    }
    // return '$language/'
  }
}

enum HttpMethod { GET, POST }
