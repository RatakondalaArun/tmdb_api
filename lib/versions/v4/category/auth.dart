part of tmdb_api;

class AuthV4 extends Category<V4> {
  // final V4 _v;
  // final String _endPoint = 'auth';

  AuthV4(V4 v)
      : assert(v != null),
        super(v, 'auth');

  ///This method generates a new request token that you can ask a user to approve.
  ///This is the first step in getting permission from a user to read and write data on their behalf.
  ///You can read more about this system [here](https://developers.themoviedb.org/4/auth/user-authorization-1).
  ///
  /// Note that there is an optional body you can post alongside this request to
  /// set a `redirect URL` that will be executed once a request token has been approved on TMDb.
  ///
  /// ## Parameters
  /// `accessToken`: *API Read Access token*
  ///
  /// `redirectTo`: set a redirect URL or callback that will be executed once a request token has been approved on TMDb.
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v4.auth.createRequestToken('your API Read access token');
  /// ```
  ///
  /// ## Result
  /// ```
  /// {
  ///     status_code: 1,
  ///     status_message: Success.,
  ///     success: true,
  ///     request_token: *******fdG9rZW4iXSwiZXhwIjoxNTg0MTgyODUwLCJqdGkiOjE5MDIzNDcsImF1ZCI6ImMyNWRkMDY4NmZkMTI4OThjMmIxODZlNjllNjcyOGZjIiw**
  /// }
  /// ```
  Future<Map> createRequestToken(
      {String redirectTo = 'http://www.themoviedb.org/'}) {
    String accessToken = _v._tmdb._apiKeys._apiReadAccessTokenv4;

    if (accessToken == null) {
      throw NullValueException('accessToken==null is true');
    }
    Map<String, String> postHeaders = {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization': 'Bearer $accessToken'
    };
    return _v._query('$_endPoint/request_token',
        method: HttpMethod.POST, postHeaders: postHeaders, postBody: {}
        //   'redirect_to': '${redirectTo ?? 'http://www.themoviedb.org/'}'
        // }
        );
  }

  ///This method will finish the user authentication flow and issue an official user access token.
  ///The request token in this request is sent along as part of the POST body.
  ///You should still use your standard API read access token for authenticating this request.
  ///
  /// ## Parameters
  ///
  /// `requestToken`: request token that you created using `tmdb.v4.auth.createRequestToken('##');`
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.v4.auth.createAccessToken(
  ///        '**9rZW4iXSwiZXhwIjoxNTg0MzUwNDIyLCJqdGkiO********');
  /// ```
  ///
  /// ## Result
  /// ```
  /// {
  ///     success: true,
  ///     access_token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQxODQ3ODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDI0MzMiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.55iMT2A0uIQVucqrDq5cmlK6qER0VVO00UNdu0gHLUM,
  ///     status_code: 1,
  ///     status_message: Success.,
  ///     account_id: 5df12163db952d0019bef026
  /// }
  /// ```
  Future<Map> createAccessToken(String requestToken) {
    String v4ApiToken = _v._tmdb._apiKeys._apiReadAccessTokenv4;
    if (v4ApiToken == null) {
      throw NullValueException('accessToken==null is true');
    }
    Map<String, String> postHeaders = {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization': 'Bearer $v4ApiToken'
    };
    return _v._query('$_endPoint/access_token',
        method: HttpMethod.POST,
        postHeaders: postHeaders,
        postBody: {'request_token': requestToken});
  }

  ///This method gives your users the ability to log out of a session.
  ///
  /// # Not working
  ///
  ///## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///## Implementation
  ///```
  ///Map result = await tmdb.v4.auth.deleteAccessToken(ACCESS_TOKEN);
  ///```
  ///## Result
  ///```
  ///{
  ///   "status_message": "The item/record was deleted successfully.",
  ///   "success": true,
  ///   "status_code": 13
  ///}
  ///```
  Future<Map> deleteAccessToken(String accessToken) {
    String v4ApiToken = _v._tmdb._apiKeys._apiReadAccessTokenv4;
    //todo:test this after implementing account
    if (v4ApiToken == null) {
      throw NullValueException('accessToken==null is true');
    }
    if (accessToken == null) {
      throw NullValueException('accessToken == null is true');
    }

    return _v._query('$_endPoint/access_token',
        method: HttpMethod.DELETE,
        deleteHeaders: {
          'Content-Type': 'application/json;charset=utf-8',
          'Authorization': 'Bearer $v4ApiToken'
        },
        deleteBody: {
          'access_token': accessToken
        });
  }
}
