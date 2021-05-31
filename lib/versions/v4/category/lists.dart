part of tmdb_api;

class ListsV4 extends Category<V4> {
  // final V4 _v;
  // final String _endPoint = 'list';

  ListsV4(V4 v) : super(v, 'list');

  ///This method will retrieve a list by id.
  ///
  ///Private lists can only be accessed by their owners and
  ///therefore require a valid user access token.
  ///
  ///## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  ///- `page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  ///
  ///- `language`: Pass a ISO 639-1 value to display translated data for the fields that support it.
  ///*minLength: 2 pattern: ([a-z]{2})-([A-Z]{2}) default: en-US*
  ///
  ///- `sortListBy`: Sort the results.
  ///Allowed Values: , original_order.asc, original_order.desc, release_date.asc, release_date.desc, title.asc, title.desc, vote_average.asc, vote_average.desc *default: SortListBy.original_order.asc*
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.lists.getList(ACCESS_TOKEN, 134718);
  ///```
  ///## Result
  ///Check out the Doc [here](https://developers.themoviedb.org/4/list/get-list)
  ///
  Future<Map> getList(String accessToken, int listId,
      {int page = 1,
      String language = 'en-US',
      SortListBy sortListBy = SortListBy.orginalOrderAsc}) {
    if (accessToken == null || listId == null) {
      throw NullValueException('accessToken == null || listId == null is true');
    }

    if (listId < 1 || page < 1 || page > 1000) {
      throw InvalidDataException(
          'listId < 1 || pageNo < 1 || pageNo > 1000 is true');
    }

    return _v._query('$_endPoint/$listId', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'page=${page ?? 1}',
      'language=${language ?? 'en-US'}',
      'sort_by=${_sortListBy(sortListBy ?? SortListBy.orginalOrderAsc)}'
    ]);
  }

  ///This method will create a new list.
  ///
  /// You will need to have valid user access token in order to create a new list.
  ///
  ///## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listName`: list will be created with this name.
  ///
  ///- `isPublic`: list will be marked as a public list
  ///
  ///- `description`: description for the list
  ///
  ///- `iso6391`: 'en'
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.lists.createList(ACCESS_TOKEN, 'My New List');
  ///```
  ///## Result
  ///```
  ///{
  ///   "status_message": "The item/record was created successfully.",
  ///   "id": 134718,
  ///   "success": true,
  ///   "status_code": 1
  ///}
  ///```
  ///
  Future<Map> createList(String accessToken, String listName,
      {String description = ' ', bool isPublic = true, iso6391 = 'en'}) {
    if (accessToken == null ||
        description == null ||
        isPublic == null ||
        iso6391 == null) {
      throw NullValueException(
          'accessToken==null||description==null||isPublic==null||iso6391==null is true');
    }

    return _v._query('$_endPoint', method: HttpMethod.POST, postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, postBody: {
      'name': listName,
      'description': description ?? '',
      'public': '$isPublic',
      'iso_639_1': iso6391 ?? 'en',
    });
  }

  ///This method will let you update the details of a list.
  ///
  /// You must be the owner of the list and therefore have a valid user access token in order to edit it.
  ///
  ///## Parameters
  ///
  ///## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  ///- `listName`: list will be created with this name.
  ///
  ///- `isPublic`: list will be marked as a public list
  ///
  ///- `description`: description for the list
  ///
  ///- `iso6391`: 'en'
  ///
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.lists.updateItems(ACCESS_TOKEN, 134718, items);
  ///```
  ///
  ///## Result
  ///```
  ///{
  ///  "status_message": "Success.",
  ///  "results": [
  ///    {
  ///      "media_type": "movie",
  ///      "media_id": 550,
  ///      "success": false
  ///    }
  ///  ],
  ///  "success": true,
  ///  "status_code": 1
  ///}
  ///```
  Future<Map> updateList(
    String accessToken,
    int listId, {
    String /*?*/ listName,
    String /*?*/ description,
    bool /*?*/ isPublic,
    String /*?*/ iso6391,
  }) {
    if (accessToken == null || listId == null) {
      throw NullValueException('accessToken == null || listId == null is true');
    }
    if (listId < 1) {
      throw InvalidDataException('listId < 1 is true');
    }

    Map<String, String> postBody = {};
    //only updated values will be added
    if (listName != null) {
      postBody.addAll({'name': listName});
    }
    if (description != null) {
      postBody.addAll({'description': description});
    }
    if (isPublic != null) {
      postBody.addAll({'public': '$isPublic'});
    }
    if (iso6391 != null) {
      postBody.addAll({'iso_639_1': iso6391});
    }

    //check if postBody is empty
    if (postBody.isEmpty) {
      throw InvalidDataException('at least one parameter must be filled');
    }

    return _v._query(
      '$_endPoint/$listId',
      method: HttpMethod.PUT,
      postHeaders: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
      postBody: postBody,
    );
  }

  ///This method lets you clear all of the items from a list in a single request.
  ///This action cannot be reversed so use it with caution.
  ///
  /// You must be the owner of the list and therefore have a valid user access token in order to clear a list.
  ///
  /// ## Parameters
  ///
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  /// ## Implementation
  /// ```
  ///Map result = await tmdb.v4.lists.clearList(ACCESS_TOKEN, 134718);
  /// ```
  /// ## Result
  /// ```
  ///
  ///{
  ///   "items_deleted": 1,
  ///   "status_message": "Success.",
  ///   "id": 10,
  ///   "status_code": 1,
  ///   "success": true
  ///}
  /// ```
  ///
  Future<Map> clearList(String accessToken, int listId) {
    if (accessToken == null || listId == null) {
      throw NullValueException('accessToken == null || listId == null is true');
    }
    if (listId < 1) {
      throw InvalidDataException('listId < 1 is true');
    }

    return _v._query(
      '$_endPoint/$listId/clear',
      postHeaders: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );
  }

  ///This method will delete a list by id. This action is not reversible so take care when issuing it.
  ///
  /// You must be the owner of the list and therefore have a valid user access token in order to delete it.
  ///
  /// ## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v4.lists.deleteList(ACCESS_TOKEN, 134718);
  /// ```
  /// ## Result
  /// ```
  /// {
  ///   "status_message": "The item/record was deleted successfully.",
  ///   "success": true,
  ///   "status_code": 13
  ///}
  /// ```
  Future<Map> deleteList(String accessToken, int listId) {
    if (accessToken == null || listId == null) {
      throw NullValueException('accessToken == null || listId == null is true');
    }
    if (listId < 1) {
      throw InvalidDataException('listId < 1 is true');
    }

    return _v._query(
      '$_endPoint/$listId',
      method: HttpMethod.DELETE,
      deleteBody: {},
      deleteHeaders: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );
  }

  /// This method will let you add items to a list. We support essentially
  /// an unlimited number of items to be posted at a time. Both movie and TV series are support.
  ///
  /// The results of this query will return a results array.
  /// Each result includes a success field. If a result is false this will
  /// usually indicate that the item already exists on the list.
  /// It may also indicate that the item could not be found.
  ///
  /// You must be the owner of the list and therefore have a valid user
  /// access token in order to add items to a list.
  ///
  /// ## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  ///- `items`: List of `ListItems`;
  ///
  ///
  /// ## Implementation
  /// ```
  /// List<ListItem> items = [
  ///  ListItem(
  ///      mediaId: 100, mediaType: MediaType.movie, comment: 'cool movie'),
  ///  ListItem(
  ///      mediaId: 102, mediaType: MediaType.movie, comment: 'cool movie2'),
  ///];
  ///Map result = await tmdb.v4.lists.addItems(ACCESS_TOKEN, 134718, items);
  ///print(result);
  /// ```
  /// ## Result
  /// ```
  /// {
  ///  "status_message": "Success.",
  ///  "results": [
  ///    {
  ///      "media_type": "movie",
  ///      "media_id": 550,
  ///      "success": false
  ///    }
  ///  ],
  ///  "success": true,
  ///  "status_code": 1
  ///}
  /// ```
  Future<Map> addItems(String accessToken, int listId, List<ListItem> items) {
    if (accessToken == null || listId == null) {
      throw NullValueException('accessToken == null || listId == null is true');
    }
    if (listId < 1) {
      throw InvalidDataException('listId < 1 is true');
    }

    List<Map<String, dynamic>> postBody = [];
    items.forEach((item) => postBody.add(item._toMap()));

    return _v._query(
      '$_endPoint/$listId/items',
      method: HttpMethod.POST,
      postBody: {'items': postBody},
      postHeaders: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );
  }

  ///This method will let you update an individual item on a list.
  ///Currently, only adding a comment is suported.
  ///
  ///You must be the owner of the list and therefore have a valid
  ///user access token in order to edit items.
  ///
  ///## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  ///- `items`: List of `ListItems`;
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.lists.updateItems(ACCESS_TOKEN, 134718, items);
  ///```
  ///## Result
  ///```
  ///{
  ///  "status_message": "Success.",
  ///  "results": [
  ///    {
  ///      "media_type": "movie",
  ///      "media_id": 194662,
  ///      "success": true
  ///    }
  ///  ],
  ///  "success": true,
  ///  "status_code": 1
  ///}
  ///```
  ///
  Future<Map> updateItems(
      String accessToken, int listId, List<ListItem> items) {
    if (accessToken == null || listId == null) {
      throw NullValueException('accessToken == null || listId == null is true');
    }
    if (listId < 1) {
      throw InvalidDataException('listId < 1 is true');
    }

    List<Map<String, dynamic>> postBody = [];
    items.forEach((item) => postBody.add(item._toMap()));

    return _v._query(
      '$_endPoint/$listId/items',
      method: HttpMethod.PUT,
      postBody: {'items': postBody},
      postHeaders: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );
  }

  ///This method will let you remove items from a list.
  ///You can remove multiple items at a time.
  ///
  ///You must be the owner of the list and therefore have
  ///a valid user access token in order to delete items from it.
  ///
  ///## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  ///- `items`: List of `ListItems`;
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.lists.removeItems(ACCESS_TOKEN, 134718, items);
  ///```
  ///## Result
  ///```
  ///{
  ///  "status_message": "Success.",
  ///  "results": [
  ///    {
  ///      "media_type": "movie",
  ///      "media_id": 194662,
  ///      "success": true
  ///    }
  ///  ],
  ///  "success": true,
  ///  "status_code": 1
  ///}
  ///```
  ///
  Future<Map> removeItems(
      String accessToken, int listId, List<ListItem> items) {
    if (accessToken == null || listId == null) {
      throw NullValueException('accessToken == null || listId == null is true');
    }
    if (listId < 1) {
      throw InvalidDataException('listId < 1 is true');
    }

    List<Map<String, dynamic>> postBody = [];
    items.forEach((item) {
      postBody.add(item._toMap());
    });

    return _v._query(
      '$_endPoint/$listId/items',
      method: HttpMethod.DELETE,
      deleteBody: {'items': postBody},
      deleteHeaders: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );
  }

  ///This method lets you quickly check if the item is already added to the list.
  ///
  ///You must be the owner of the list and therefore have a valid
  ///user access token in order to check an item status.
  ///
  ///## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `listId`: id of the list that you want to retrive
  ///
  ///- `mediaId`: id of the movie || tv
  ///
  ///- `mediaType`:type of media *Allowed Values: movie, tv*

  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.lists
  /// .checkItemStatus(ACCESS_TOKEN, 134718, 550, MediaType.movie);
  ///```
  ///
  ///## Result
  ///```
  ///{
  ///   "media_type": "movie",
  ///   "success": true,
  ///   "status_message": "Success.",
  ///   "id": 1,
  ///   "media_id": 99861,
  ///   "status_code": 1
  ///}
  ///```
  Future<Map> checkItemStatus(
      String accessToken, int listId, int mediaId, MediaType mediaType) {
    if (accessToken == null ||
        listId == null ||
        mediaId == null ||
        mediaType == null) {
      throw NullValueException(
          'accessToken == null || listId == null||mediaId==null||mediaType==null is true');
    }
    if (listId < 1 || mediaId < 1) {
      throw InvalidDataException('listId < 1 || mediaId < 1 is true');
    }

    return _v._query('$_endPoint/$listId/item_status', postHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json;charset=utf-8',
    }, optionalQueries: [
      'media_id=$mediaId',
      'media_type=${_getMediaType(MediaType.movie)}'
    ]);
  }

  String _sortListBy(SortListBy sortListBy) {
    switch (sortListBy) {
      case SortListBy.orginalOrderAsc:
        return 'original_order.asc';
      case SortListBy.orginalOrderDesc:
        return 'original_order.desc';
      case SortListBy.releaseDateAsc:
        return 'release_date.asc';
      case SortListBy.releaseDateDesc:
        return 'release_date.desc';
      case SortListBy.titleAsc:
        return 'title.asc';
      case SortListBy.titleDesc:
        return 'title.desc';
      case SortListBy.voteAverageAsc:
        return 'vote_average.asc';
      case SortListBy.voteAverageDesc:
        return 'vote_average.desc';
      default:
        return 'original_order.asc';
    }
  }

  String _getMediaType(MediaType mediaType) {
    switch (mediaType) {
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
      default:
        return 'movie';
    }
  }
}
