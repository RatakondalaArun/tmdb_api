part of tmdb_api;

class ApiKeys {
  final String _apiKeyV3;
  final String _apiReadAccessTokenv4;

  ApiKeys(this._apiKeyV3, this._apiReadAccessTokenv4)
      : assert(_apiKeyV3 != null),
        assert(_apiReadAccessTokenv4 != null);
}
