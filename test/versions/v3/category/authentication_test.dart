@Skip('Only manual tests are possible')
library;

import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';
import '../../../init_script.dart' as user;

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));
  group('Authentication', () {
    group('Request token', () {
      test('As String', () async {
        final result = await tmdb.v3.auth.createRequestToken() as String;
        expect(result, isA<String>());
      });
    });

    group('>createSession', () {
      test('>generating session id with username and password', () async {
        final requestToken = await tmdb.v3.auth.createRequestToken() as String;
        final sessionId = await tmdb.v3.auth.createSession(requestToken) as String;
        expect(sessionId, isA<String>());
      });
    });
    group('Create session with login', () {
      test('generate with creditionals', () async {
        final result = await tmdb.v3.auth.createSessionWithLogin(
          user.User.username!,
          user.User.password!,
        ) as String?;
        expect(result == null, isFalse);
      });
      test('>with wrong creditionals', () async {
        final result = await tmdb.v3.auth.createSessionWithLogin('foobartest', 'foobarpass') as String?;
        expect(result == null, isTrue);
      });
      test('>with wrong creditionals as Map', () async {
        final result = await tmdb.v3.auth.createSessionWithLogin('foobartest', 'foobarpass', asMap: true) as Map?;
        expect(result is Map, isTrue);
      });
    });

    group('>delete session', () {
      test('>with session id', () async {
        // ignore: unused_local_variable
        final result = await tmdb.v3.auth.deleteSession(
          '98097f2cd6af83f272ccbcfa93960723a940f87b',
        );
      });
    });

    group('>guest session', () {
      test('>getting session as String', () async {
        final guestSessionId = await tmdb.v3.auth.createGuestSession() as String?;
        expect(guestSessionId, isNotNull);
      });

      test('>getting session as Map', () async {
        final result = await tmdb.v3.auth.createGuestSession(asMap: true) as Map?;
        expect(result, isNotNull);
      });
    });

    group('>session from v4 token', () {
      test('>getting session as String', () async {
        final guestSessionId = await tmdb.v3.auth.createSessionFromV4AccessToken(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c',
        ) as String;
        print(guestSessionId);
      });

      test('>getting session as Map', () async {
        final result = await tmdb.v3.auth.createSessionFromV4AccessToken(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c',
          asMap: true,
        ) as Map;
        expect(result, isNotNull);
        expect(result, isA<Map>());
      });
    });
  });
}
