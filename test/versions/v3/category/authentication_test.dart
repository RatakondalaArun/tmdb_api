@Skip('Only manual tests are possible')

import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';
import '../../../init_script.dart' as user;

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Authentication', () {
    group('Request token', () {
      test('As String', () async {
        final result = await tmdb.v3.auth.createRequestToken() as String;
        expect(result == null, false);
      });
      test('As Map', () async {
        final result =
            await tmdb.v3.auth.createRequestToken(asMap: true) as Map;
        expect(result is Map, true);
      });
    });

    group('>createSession', () {
      test('>generating session id with username and password', () async {
        String requestToken = await tmdb.v3.auth.createRequestToken() as String;
        String? sessionId =
            await tmdb.v3.auth.createSession(requestToken) as String;
      });
    });
    group('Create session with login', () {
      test('generate with creditionals', () async {
        String? result = await tmdb.v3.auth.createSessionWithLogin(
            user.User.USERNAME!, user.User.PASSWORD!) as String;
        expect(result == null, false);
      });
      test('>with wrong creditionals', () async {
        String? result = await tmdb.v3.auth
            .createSessionWithLogin('foobartest', 'foobarpass') as String;
        expect(result == null, true);
      });
      test('>with wrong creditionals as Map', () async {
        Map? result = await tmdb.v3.auth
                .createSessionWithLogin('foobartest', 'foobarpass', asMap: true)
            as Map;
        expect(result is Map, true);
      });
    });

    group('>delete session', () {
      test('>with session id', () async {
        final result = await (tmdb.v3.auth
            .deleteSession('98097f2cd6af83f272ccbcfa93960723a940f87b'));
        print(result);
        expect(result is Map, true);
      });
    });

    group('>guest session', () {
      test('>getting session as String', () async {
        String? guestSessionId =
            await tmdb.v3.auth.createGuestSession() as String;
      });

      test('>getting session as Map', () async {
        Map? result = await tmdb.v3.auth.createGuestSession(asMap: true) as Map;
      });
    });

    group('>session from v4 token', () {
      test('>getting session as String', () async {
        final guestSessionId = await tmdb.v3.auth.createSessionFromV4AccessToken(
                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c')
            as String;
        print(guestSessionId);
      });

      test('>getting session as Map', () async {
        final result = await tmdb.v3.auth.createSessionFromV4AccessToken(
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c',
            asMap: true) as Map;
      });
    });
  });
}
