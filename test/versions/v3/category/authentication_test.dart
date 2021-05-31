@Skip('Only manual tests are possible')

import 'package:test/test.dart';
import '../../../init_script.dart';
import '../../../init_script.dart' as user;
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  TMDB tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Authentication', () {
    group('Request token', () {
      test('As String', () async {
        String? result = await (tmdb.v3.auth.createRequestToken());
        print(result);
        expect(result == null, false);
      });
      test('As Map', () async {
        Map? result = await (tmdb.v3.auth.createRequestToken(asMap: true));
        expect(result is Map, true);
        print(result);
      });
    });

    group('>createSession', () {
      test('>generating session id with username and password', () async {
        String requestToken = await (tmdb.v3.auth.createRequestToken());
        String? sessionId = await (tmdb.v3.auth.createSession(requestToken));
        print(sessionId);
      });
    });
    group('Create session with login', () {
      test('generate with creditionals', () async {
        String? result = await (tmdb.v3.auth
            .createSessionWithLogin(user.User.USERNAME!, user.User.PASSWORD!));
        print(result);
        expect(result == null, false);
      });
      test('>with wrong creditionals', () async {
        String? result = await (tmdb.v3.auth
            .createSessionWithLogin('foobartest', 'foobarpass'));
        print(result);
        expect(result == null, true);
      });
      test('>with wrong creditionals as Map', () async {
        Map? result = await (tmdb.v3.auth
            .createSessionWithLogin('foobartest', 'foobarpass', asMap: true));
        print(result);
        expect(result is Map, true);
      });
    });

    group('>delete session', () {
      test('>with session id', () async {
        Map result = await (tmdb.v3.auth
            .deleteSession('98097f2cd6af83f272ccbcfa93960723a940f87b'));
        print(result);
        expect(result is Map, true);
      });
    });

    group('>guest session', () {
      test('>getting session as String', () async {
        String? guestSessionId = await (tmdb.v3.auth.createGuestSession());
        print(guestSessionId);
      });

      test('>getting session as Map', () async {
        Map? result = await (tmdb.v3.auth.createGuestSession(asMap: true));
        print(result);
      });
    });

    group('>session from v4 token', () {
      test('>getting session as String', () async {
        String? guestSessionId = await (tmdb.v3.auth.createSessionFromV4AccessToken(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c'));
        print(guestSessionId);
      });

      test('>getting session as Map', () async {
        Map? result = await (tmdb.v3.auth.createSessionFromV4AccessToken(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c',
            asMap: true));
        print(result);
      });
    });
  });
}
