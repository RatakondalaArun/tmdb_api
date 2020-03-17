part of tmdb_api;

class Lists {
  final V3 _v3;
  final String _endPoint = 'list';
  Lists(this._v3) : assert(_v3 != null);

  ///Get the details of a list.
  ///
  ///## Parameters
  ///`listId`: id of a list to be retrived
  ///
  ///`language`: default is 'en-US'.Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///
  ///
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.v3.lists.getList('50941077760ee35e1500000c');
  /// ```
  ///
  Future<Map> getDetails(String listId, {String language = 'en-US'}) {
    if (listId == null) throw NullValueException('listId == null is true');
    return _v3
        ._query('$_endPoint/$listId', optionalQueries: ['language=$language']);
  }

  ///You can use this method to check if a movie has already been added to the list.
  ///
  ///## parameters
  ///`listId`: id of a list to be searched
  ///
  ///`movieId`: if of movie to be searched in that list
  ///
  ///## Implementation
  ///```
  ///
  ///```
  Future<Map> checkItemStatus(String listId, int movieId) {
    if (listId == null || movieId == null || movieId < 1)
      throw NullValueException(
          'listId == null||movieId==null||movieId < 1 is true');
    return _v3
        ._query('$_endPoint/$listId', optionalQueries: ['movie_id=$movieId']);
  }

  ///Create a list.
  ///
  ///## Parameters
  ///`sessionId`: id of current session
  ///
  ///`name`: name of the list
  ///
  ///`description`: description of the list
  ///## Implementation
  ///
  ///```
  ///Map result = await tmdb.v3.lists.createList(
  /// '21b318c9b6fbaa28c62cb3a60796ad3b481fd20a',
  /// 'testing this api',
  /// 'lol move time');
  ///```
  ///
  ///## Result
  ///```
  ///{
  ///     "status_code": 1,
  ///     "status_message": "The item/record was created successfully.",
  ///     "success": true,
  ///     "list_id": 134718
  /// }
  ///```
  Future<Map> createList(String sessionId, String name, String description,
      {String language = 'en'}) {
    if (sessionId == null || description == null || name == null)
      throw NullValueException(
          'sessionId==null||description==null||name==null is true');
    Map postBody = {
      'name': name,
      'description': description,
      'language': language
    };
    return _v3._query('$_endPoint',
        optionalQueries: ['session_id=$sessionId'],
        method: HttpMethod.POST,
        postBody: postBody);
  }

  ///Add a media to a list.
  ///
  ///## Parameters
  ///`sessionId`: current session
  ///
  ///`listId`: if of the list
  ///
  ///`mediaId`: id of the media that you want to add to the list TV show id/ Movie Id
  ///
  ///## Implementation
  ///
  ///```
  ///Map result = await tmdb.v3.lists
  ///             .addMovie('21b318c9b6fbaa28c62cb3a60796ad3b481fd20a', 134721, 20);
  ///```
  ///
  ///## Result
  ///```
  ///{
  /// status_code: 12,
  /// status_message: The item/record was updated successfully.
  ///}
  ///```
  Future<Map> addItem(String sessionId, String listId, int mediaId) {
    if (sessionId == null || mediaId == null || mediaId < 1 || listId == null)
      throw NullValueException(
          'sessionId == null || mediaId == null || mediaId < 1 || listId == null || listId < 1 is true');
    return _v3._query('$_endPoint/$listId/add_item',
        method: HttpMethod.POST,
        postBody: {'media_id': '$mediaId'},
        optionalQueries: ['session_id=$sessionId']);
  }

  ///Remove a movie from a list.
  ///
  ///## Parameters
  ///`sessionId`: current session
  ///
  ///`listId`: if of the list
  ///
  ///`mediaId`: id of the media that you want to add to the list TV show id/ Movie I
  ///
  ///## Implementation
  ///
  ///```
  ///Map result = await tmdb.v3.lists
  /// .removeItem('98097f2cd6af83f272ccbcfa93960723a940f87b', 134721, 20);
  ///```
  ///
  ///## Result
  ///If item removed
  ///```
  ///{
  /// status_code: 13,
  /// status_message: The item/record was deleted successfully.
  ///}
  ///```
  ///If item doesn't exist
  ///```
  ///{
  /// status_code: 21,
  /// status_message: Entry not found: The item you are trying to edit cannot be found.
  ///}
  ///```
  Future<Map> removeItem(String sessionId, String listId, int mediaId) {
    if (sessionId == null || mediaId == null || mediaId < 1 || listId == null)
      throw NullValueException(
          'sessionId == null || mediaId == null || mediaId < 1 || listId == null || listId < 1 is true');
    return _v3._query('$_endPoint/${listId.toString()}/remove_item',
        method: HttpMethod.POST,
        postBody: {'media_id': "$mediaId"},
        optionalQueries: ['session_id=$sessionId']);
  }

  ///
  ///Clear all of the items from a list.
  ///
  ///
  ///## Parameters
  ///`sessionId`: current session
  ///
  ///`listId`: if of the list
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.lists
  /// .clearList('98097f2cd6af83f272ccbcfa93960723a940f87b', '134721');
  ///```
  ///## Result
  ///```
  ///{
  ///     "status_code": 12,
  ///     "status_message": "The item/record was updated successfully."
  ///}
  ///```
  Future<Map> clearList(String sessionId, String listId) {
    if (sessionId == null || listId == null)
      throw NullValueException('sessionId == null || listId == null is true');

    return _v3._query('$_endPoint/$listId/clear',
        method: HttpMethod.POST,
        postBody: {},
        optionalQueries: ['session_id=$sessionId', 'confirm=true']);
  }

  ///Delete a list.
  ///
  ///## Parameters
  ///`sessionId`: current session
  ///
  ///`listId`: id of the list
  ///## Implementation
  ///```
  ///Map result = await tmdb.v3.lists
  /// .deleteList('98097f2cd6af83f272ccbcfa93960723a940f87b', '134721');
  ///```
  Future<Map> deleteList(String sessionId, String listId) {
    if (sessionId == null || listId == null)
      throw NullValueException('sessionId == null || listId == null is true');

    return _v3._query('$_endPoint/$listId',
        method: HttpMethod.DELETE,
        optionalQueries: ['session_id=$sessionId'],
        deleteBody: {});
  }
}
