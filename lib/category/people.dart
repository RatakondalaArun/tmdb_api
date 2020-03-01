part of tmdb_api;

class People {
  final V3 _v3;
  final String _endPoint = 'person';

  People(this._v3);

  ///Get the primary person details by id.
  Future<Map> getDetails(int personId, {Parameters parameters}) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId', parameters: parameters);
  }

  ///Get the changes for a person.
  /// By default only the last 24 hours are returned.
  Future<Map> getChanges(int personId) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/changes');
  }

  ///Get the movie credits for a person.
  ///only supports language feilds in [parameters]'s append
  Future<Map> getMovieCredits(int personId, {Parameters parameters}) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/movie_credits',
        parameters: parameters);
  }

  ///Get the TV show credits for a person.
  ///only supports language feilds in [parameters]'s append
  Future<Map> getTvCredits(int personId, {Parameters parameters}) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/tv_credits',
        parameters: parameters);
  }

  ///Get the movie and TV credits together in a single response.
  ///only supports language feilds in [parameters]'s append
  Future<Map> getCombinedCredits(int personId, {Parameters parameters}) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/combined_credits',
        parameters: parameters);
  }

  ///Get the external ids for a person.
  ///
  /// We currently support the following external sources.
  ///
  ///   External Sources
  ///- `IMDB ID`
  ///- `Facebook`
  ///- `Freebase MID`
  ///- `Freebase ID`
  ///- `Instagram`
  ///- `TVRage ID`
  ///- `Twitter`
  Future<Map> getExternalIds(int personId, {Parameters parameters}) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/external_ids',
        parameters: parameters);
  }

  ///Get the images for a person.
  Future<Map> getImages(int personId) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/images');
  }

  ///Get the images that this person has been tagged in.
  Future<Map> getTaggedImages(int personId, {Parameters parameters}) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/tagged_images',
        parameters: parameters);
  }

  ///Get a list of translations that have been created for a person.
  Future<Map> getTranslations(int personId, {Parameters parameters}) {
    assert(personId != null && personId > 0);
    return _v3._query('$_endPoint/$personId/translations',
        parameters: parameters);
  }

  ///Get the most newly created person. This is a live response and will continuously change.
  Future<Map> getLatest({Parameters parameters}) {
    return _v3._query('$_endPoint/latest', parameters: parameters);
  }

  ///Get the list of popular people on TMDb.
  /// This list updates daily.
  Future<Map> getPopular({Parameters parameters}) {
    return _v3._query('$_endPoint/popular');
  }
}
