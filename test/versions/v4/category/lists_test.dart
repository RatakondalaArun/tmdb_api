@Skip('Only manual tests are possible')
import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.apiV3!, Keys.apiV4!));

  const accessToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYmYiOjE1ODQzNjgxODYsInN1YiI6IjVkZjEyMTYzZGI5NTJkMDAxOWJlZjAyNiIsImp0aSI6IjE5MDcxMDgiLCJhdWQiOiJjMjVkZDA2ODZmZDEyODk4YzJiMTg2ZTY5ZTY3MjhmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdLCJ2ZXJzaW9uIjoxfQ.cCgOIDlLk7F0LS-OlMJNl059TucIspxhhENuTW_dE1c';

  const listId = 136451;
  final items = <ListItem>[
    const ListItem(
      mediaId: 550,
      comment: 'updated cool movie',
    ),
    const ListItem(
      mediaId: 102,
      mediaType: MediaType.tv,
      comment: 'updated cool movie2',
    ),
  ];
  group('Lists', () {
    test('Create Lists', () async {
      final result = await tmdb.v4.lists.createList(accessToken, 'Hello Test from ');
      print(result);

      expect(result['status_code'], 1);
    });

    test('get List', () async {
      final result = await tmdb.v4.lists.getList(accessToken, listId);
      print(result);

      expect(result['id'], listId);
    });

    test('update list', () async {
      final result = await tmdb.v4.lists.updateList(
        accessToken,
        listId,
        listName: 'updated list name $listId',
      );
      print(result);

      expect(result['success'], true);
    });

    test('clear List', () async {
      final result = await tmdb.v4.lists.clearList(accessToken, listId);
      print(result);

      expect(result['status_code'], 1);
    });

    test('delete List', () async {
      final result = await tmdb.v4.lists.deleteList(accessToken, listId);
      print(result);

      expect(result['status_code'], 13);
    });

    test('add items', () async {
      final result = await tmdb.v4.lists.addItems(accessToken, listId, items);
      print(result);

      expect(result['status_code'], 1);
    });

    test('update List items', () async {
      final result = await tmdb.v4.lists.updateItems(accessToken, listId, items);
      print(result);

      expect(result['status_code'], 1);
    });

    test('remove items', () async {
      final result = await tmdb.v4.lists.removeItems(accessToken, listId, items);
      print(result);

      expect(result['status_code'], 1);
    });

    test('check item status', () async {
      final result = await tmdb.v4.lists.checkItemStatus(accessToken, listId, 550, MediaType.movie);
      print(result);
    });
  });
}
