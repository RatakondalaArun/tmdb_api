@Skip('Only manual tests are possible')
import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));

  const ACCESS_TOKEN =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c';

  const LIST_ID = 136451;
  final items = <ListItem>[
    ListItem(
        mediaId: 550,
        mediaType: MediaType.movie,
        comment: 'updated cool movie'),
    ListItem(
        mediaId: 102, mediaType: MediaType.tv, comment: 'updated cool movie2'),
  ];
  group('Lists', () {
    test('Create Lists', () async {
      final result =
          await tmdb.v4.lists.createList(ACCESS_TOKEN, 'Hello Test from ');
      print(result);
      expect(result is Map, true);
      expect(result['status_code'], 1);
    });

    test('get List', () async {
      final result = await tmdb.v4.lists.getList(ACCESS_TOKEN, LIST_ID);
      print(result);
      expect(result is Map, true);
      expect(result['id'], LIST_ID);
    });

    test('update list', () async {
      final result = await tmdb.v4.lists.updateList(ACCESS_TOKEN, LIST_ID,
          listName: 'updated list name $LIST_ID');
      print(result);
      expect(result is Map, true);
      expect(result['success'], true);
    });

    test('clear List', () async {
      final result = await tmdb.v4.lists.clearList(ACCESS_TOKEN, LIST_ID);
      print(result);
      expect(result is Map, true);
      expect(result['status_code'], 1);
    });

    test('delete List', () async {
      final result = await tmdb.v4.lists.deleteList(ACCESS_TOKEN, LIST_ID);
      print(result);
      expect(result is Map, true);
      expect(result['status_code'], 13);
    });

    test('add items', () async {
      final result = await tmdb.v4.lists.addItems(ACCESS_TOKEN, LIST_ID, items);
      print(result);
      expect(result is Map, true);
      expect(result['status_code'], 1);
    });

    test('update List items', () async {
      final result =
          await tmdb.v4.lists.updateItems(ACCESS_TOKEN, LIST_ID, items);
      print(result);
      expect(result is Map, true);
      expect(result['status_code'], 1);
    });

    test('remove items', () async {
      final result =
          await tmdb.v4.lists.removeItems(ACCESS_TOKEN, LIST_ID, items);
      print(result);
      expect(result is Map, true);
      expect(result['status_code'], 1);
    });

    test('check item status', () async {
      final result = await tmdb.v4.lists
          .checkItemStatus(ACCESS_TOKEN, LIST_ID, 550, MediaType.movie);
      print(result);
      expect(result is Map, true);
    });
  });
}
