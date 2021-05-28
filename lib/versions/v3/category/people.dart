part of tmdb_api;

class People extends Category<V3> {
  // final V3 _v;
  // final String _endPoint = 'person';

  People(V3 v)
      : assert(v != null),
        super(v, 'person');

  ///Get the primary person details by id.
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// `appendToResponse`: Append requests within the same namespace to the response. *pattern: ([\w]+)*
  /// you can find more [here](https://developers.themoviedb.org/3/getting-started/append-to-response).
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getDetails(103)
  /// ```
  Future<Map> getDetails(int personId,
      {String language = 'en-US', String appendToResponse}) {
    if (language == null || personId == null) {
      throw NullValueException('language == null || personId == null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    List<String> para = ['language=$language'];
    if (appendToResponse != null) {
      para.add('append_to_response=$appendToResponse');
    }

    return _v._query('$_endPoint/$personId', optionalQueries: para);
  }

  ///Get the changes for a person.
  /// By default only the last 24 hours are returned.
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getChanges(103)
  /// ```
  Future<Map> getChanges(int personId) {
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }
    return _v._query('$_endPoint/$personId/changes');
  }

  ///Get the movie credits for a person.
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getMovieCredits(103)
  /// ```
  Future<Map> getMovieCredits(int personId, {String language = 'en-US'}) {
    if (language == null || personId == null) {
      throw NullValueException('language == null || personId == null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    return _v._query('$_endPoint/$personId/movie_credits',
        optionalQueries: ['language=$language']);
  }

  ///Get the TV show credits for a person.
  ///only supports language feilds in [parameters]'s append
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getTvCredits(103)
  /// ```
  Future<Map> getTvCredits(int personId, {String language = 'en-US'}) {
    if (language == null || personId == null) {
      throw NullValueException('language == null || personId == null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    return _v._query('$_endPoint/$personId/tv_credits',
        optionalQueries: ['language=$language']);
  }

  ///Get the movie and TV credits together in a single response.
  ///only supports language feilds in [parameters]'s append
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getCombinedCredits(103)
  /// ```
  Future<Map> getCombinedCredits(int personId, {String language = 'en-US'}) {
    if (language == null || personId == null) {
      throw NullValueException('language == null || personId == null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    return _v._query('$_endPoint/$personId/combined_credits',
        optionalQueries: ['language=$language']);
  }

  ///Get the external ids for a person.
  ///
  /// TMDB currently support the following external sources.
  ///
  ///   External Sources
  ///- `IMDB ID`
  ///- `Facebook`
  ///- `Freebase MID`
  ///- `Freebase ID`
  ///- `Instagram`
  ///- `TVRage ID`
  ///- `Twitter`
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getCombinedCredits(103)
  /// ```
  Future<Map> getExternalIds(int personId, {String language = 'en-US'}) {
    if (language == null || personId == null) {
      throw NullValueException('language == null || personId == null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    return _v._query('$_endPoint/$personId/external_ids',
        optionalQueries: ['language=$language']);
  }

  ///Get the images for a person.
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getCombinedCredits(103)
  /// ```
  Future<Map> getImages(int personId) {
    if (personId == null) {
      throw NullValueException('personId==null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    return _v._query('$_endPoint/$personId/images');
  }

  ///Get the images that this person has been tagged in.
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// `page`: Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getTaggedImages(103)
  /// ```
  Future<Map> getTaggedImages(int personId,
      {String language = 'en-US', int page = 1}) {
    if (language == null || personId == null || page == null) {
      throw NullValueException(
          'language == null || page == null || personId == null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    return _v._query('$_endPoint/$personId/tagged_images',
        optionalQueries: ['language=$language', 'page=$page']);
  }

  ///Get a list of translations that have been created for a person.
  ///
  ///## Parameters
  ///`personId`: Id of a given people.
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getTranslations(103)
  /// ```
  Future<Map> getTranslations(int personId, {String language = 'en-US'}) {
    if (language == null || personId == null) {
      throw NullValueException('language == null || personId == null is true');
    }
    if (personId < 1) {
      throw InvalidDataException('personId < 1 is true');
    }

    return _v._query('$_endPoint/$personId/translations',
        optionalQueries: ['language=$language']);
  }

  ///Get the most newly created person. This is a live response and will continuously change.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getLatest();
  /// ```
  Future<Map> getLatest({String language = 'en-US'}) {
    if (language == null) {
      throw NullValueException('language == null is true');
    }

    return _v
        ._query('$_endPoint/latest', optionalQueries: ['language=$language']);
  }

  ///Get the list of popular people on TMDb.
  /// This list updates daily.
  ///
  ///## Parameters
  ///
  ///`language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  /// *minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  /// `page`: Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v3.people.getPopular();
  /// ```
  Future<Map> getPopular({String language = 'en-US', int page = 1}) {
    if (language == null || page == null) {
      throw NullValueException('language == null || page == null  is true');
    }

    return _v._query('$_endPoint/popular',
        optionalQueries: ['language=$language', 'page=$page']);
  }
}
