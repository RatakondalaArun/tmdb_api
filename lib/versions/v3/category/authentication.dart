part of tmdb_api;

class Auth {
  final V3 _v3;
  Auth(this._v3);

  ///This method will let you create a new guest session.
  ///Guest sessions are a type of session that will let a user rate movies and TV shows
  ///but not require them to have a TMDb user account.
  /// More information about user authentication can be found
  /// [here](https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id).
  ///
  /// Please note, you should only generate a single guest session
  /// per user (or device) as you will be able to attach the ratings
  /// to a TMDb user account in the future.
  /// There is also IP limits in place so you should always make
  /// sure it's the end user doing the guest session actions.
  /// If a guest session is not used for the first time within 24 hours, it will be automatically deleted.
  ///
  /// ## Parameters
  /// `asMap`: return result in Map format if set to true
  ///
  /// ## implementation
  /// ```
  /// //result in String
  /// String guestSessionId = await tmdb.v3.auth.createGuestSession();
  /// print(result);
  /// //result in  Map
  /// Map result = await tmdb.v3.auth.createGuestSession(asMap: true);
  /// print(result);
  /// ```
  /// ## Result
  /// ```
  /// //when asMap is set to false
  /// aa9e0d0d083d40d7d46e9d57eccc7032
  /// ```
  /// ```
  ///
  /// //When AsMap is set to true
  /// {
  ///   success: true,
  ///   guest_session_id: 213fcecb154cca82b6bc7a9fbaef66d2,
  ///   expires_at: 2020-03-05 12:12:27 UTC
  /// }
  /// ```
  /// if sucess returns token which looks like *(aa9e0d0d083d40d7d46e9d57eccc7032)*
  /// else returns null
  ///
  Future<dynamic> createGuestSession({bool asMap = false}) async {
    Map result = await _v3._query('authentication/guest_session/new');
    if (asMap) {
      return result;
    }
    if (result.containsKey('guest_session_id')) {
      return result['guest_session_id'];
    }
    return null;
  }

  ///Create a temporary request token that can be used to validate
  /// a TMDb user login.
  /// More details about how this works can be found
  /// [here](https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id)
  ///
  /// ## Parameters
  /// `AsMap`: if you want result in a `Map` format, *default value is `false`*
  ///
  /// ## implementation
  /// ```
  /// //result in String
  /// String result = await tmdb.v3.auth.createRequestToken();
  /// print(result);
  /// //result in  Map
  /// Map result = await tmdb.v3.auth.createRequestToken(asMap: true);
  /// print(result);
  /// ```
  /// ## Result
  /// ```
  /// //when asMap is set to false
  /// 2fe673a7b046816360617005a8159d9d5d1c5e4a
  /// ```
  /// ```
  ///
  /// //When AsMap is set to true
  /// {
  ///   success: true,
  ///   expires_at: 2020-03-03 14:56:25 UTC,
  ///   request_token: 2fe673a7b046816360617005a8159d9d5d1c5e4a
  /// }
  /// ```
  /// if sucess returns token which looks like *(e89f630be7debce68c72e4d04579615683df78ae)*
  /// else returns null
  ///
  Future<dynamic> createRequestToken({bool asMap = false}) async {
    Map result = await _v3._query('authentication/token/new');
    if (asMap) {
      return result;
    }
    if (result.containsKey('success')) {
      return result['request_token'];
    }
    print('Auth createRequest result from tmdb = ${result.toString()}');
    return null;
  }

  ///Returns a validating URL which can be used to create approve request
  String getValidationUrl(String requestToken) {
    return 'https://www.themoviedb.org/authenticate/$requestToken';
  }

  ///You can use this method to create a fully valid session ID once a user
  ///has validated the request token.
  ///More information about how this works can be found
  ///[here](https://developers.themoviedb.org/3/authentication/how-do-i-generate-a-session-id).
  ///
  /// Before calling this function user must approve the request
  ///
  /// ## Parameters
  ///
  /// `AsMap`: if you want result in a `Map` format, *default value is `false`*
  ///
  /// ## implementation
  /// ```
  /// //result in String
  /// String result = await tmdb.v3.auth.createSession('2a3dda0baa61bed08d16f8310dd4852c23133c25');
  /// print(result);
  /// //result in  Map
  /// Map result = await tmdb.v3.auth.createSession(asMap: true);
  /// print(result);
  /// ```
  /// ## Result
  /// ```
  /// //when asMap is set to false
  /// 79191836ddaa0da3df76a5ffef6f07ad6ab0c641
  /// ```
  /// ```
  ///
  /// //When AsMap is set to true
  /// {
  ///   "success": true,
  ///   "session_id": "79191836ddaa0da3df76a5ffef6f07ad6ab0c641"
  /// }
  /// ```
  /// if sucess returns token which looks like *(e89f630be7debce68c72e4d04579615683df78ae)*
  /// else returns null
  ///
  Future<dynamic> createSession(String requestToken,
      {bool asMap = false}) async {
    if (requestToken == null) {
      throw NullValueException('requestToken==null is true',
          source: 'auth.createSession($requestToken)',
          help: 'try no to provide null value');
    }

    Map result = await _v3._query('authentication/session/new',
        optionalQueries: ['request_token=$requestToken']);
    if (asMap) {
      return result;
    }
    if (result.containsKey('success')) {
      return result['session_id'];
    }
    print(
        'Auth createSession failed => result from tmdb = ${result.toString()}');
    return null;
  }

  ///creates a request token with your tmdb user id and password using which you can generate a session
  ///
  ///## Parameters
  ///
  ///`username`: user TMDB username
  ///
  ///`password`: user TMDB password
  ///
  /// `AsMap`: if you want result in a `Map` format, *default value is `false`*
  ///
  Future<dynamic> createSessionWithLogin(String username, String password,
      {bool asMap = false}) async {
    //check for null values
    if (username == null || password == null) {
      throw NullValueException('username==null || password==null is true',
          source: 'auth.createSessionWithLogin($username, $password)',
          help: 'values should not be null');
    }
    //creating a request token
    String requestToken = await createRequestToken();
    Map postBody = {
      'username': username,
      'password': password,
      'request_token': requestToken
    };
    Map result = await _v3._query('authentication/token/validate_with_login',
        method: HttpMethod.POST, postBody: postBody);
    if (asMap) {
      return result;
    }
    if (result.containsKey('success')) {
      return result['request_token'];
    }
    return null;
  }

  ///Use this method to create a v3 session ID if you already have a valid v4 access token.
  /// The v4 token needs to be authenticated by the user.
  /// Your standard "read token" will not validate to create a session ID.
  ///
  /// ## Parameters
  ///- `accessToken`: a v4 access token which can be created using `tmdb.v4.auth.createAccesToken('RequestToken')`
  ///
  ///- `AsMap`: if you want result in a `Map` format, *default value is `false`*
  ///
  /// ## Implementation
  /// ```
  /// ```
  /// ## Result
  /// ```
  ///{
  ///   "success": true,
  ///   "session_id": "2629f70fb498edc263a0adb99118ac41f0053e8c"
  ///}
  /// ```
  Future<dynamic> createSessionFromV4AccessToken(String accessToken,
      {bool asMap = false}) async {
    if (accessToken == null) {
      throw NullValueException('accessToken == null is true');
    }

    Map result = await _v3._query('authentication/session/convert/4',
        method: HttpMethod.POST, postBody: {'access_token': accessToken});
    if (asMap) {
      return result;
    }
    if (result.containsKey('success')) {
      return result['session_id'];
    }
    return null;
  }

  ///If you would like to delete (or "logout") from a session,
  /// call this method with a valid session ID.
  /// ## Parameters
  ///`sessionId`: if of current session
  Future<dynamic> deleteSession(String sessionId) async {
    if (sessionId == null) {
      throw NullValueException('sessionId==null is true',
          source: 'auth.deleteSession($sessionId)');
    }
    Map result = await _v3._query('authentication/session',
        postHeaders: {'session_id': sessionId},
        method: HttpMethod.DELETE,
        deleteBody: {'session_id': '$sessionId'});
    print(result);
    return result;
  }
}
