import 'package:flutter_test/flutter_test.dart';

import '../../lib/tmdb_api.dart';
import '../../lib/keys.dart';

void main() {
  TMDB tmdb = TMDB(Keys.API);
  group('Lists', () {
    group('>details', () {
      test('>get Details', () async {
        Map result = await tmdb.v3.lists.getDetails('50941077760ee35e1500000c');
        print(result['created_by']);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.getDetails(null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
    });

    group('>Check item status', () {
      test('>checking', () async {
        Map result = await tmdb.v3.lists
            .checkItemStatus('50941077760ee35e1500000c', 123);
        print(result['created_by']);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.checkItemStatus(null, null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
    });
    group('>Create list', () {
      test('>checking', () async {
        Map result = await tmdb.v3.lists.createList(
            '21b318c9b6fbaa28c62cb3a60796ad3b481fd20a',
            'testing this api',
            'lol move time');
        print(result['created_by']);
        print(result);
        expect(result is Map, true);
        expect(result.containsKey('list_id'), true);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.checkItemStatus(null, null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
    });
    group('>Add movie', () {
      test('>checking', () async {
        Map result = await tmdb.v3.lists
            .addItem('21b318c9b6fbaa28c62cb3a60796ad3b481fd20a', '134721', 12);
        print(result);
        expect(result is Map, true);
        expect(result['status_message'],
            'The item/record was updated successfully.');
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.addItem(null, null, null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
    });
    group('>Remove item', () {
      test('>checking', () async {
        Map result = await tmdb.v3.lists.removeItem(
            '98097f2cd6af83f272ccbcfa93960723a940f87b', '134721', 12);
        print(result);
        expect(result is Map, true);
        // expect(result['status_message'],
        //     'The item/record was updated successfully.');
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.removeItem(null, null, null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
    });

    group('>Clear list', () {
      test('>checking', () async {
        Map result = await tmdb.v3.lists
            .clearList('98097f2cd6af83f272ccbcfa93960723a940f87b', '134721');
        print(result);
        expect(result is Map, true);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.clearList(null, null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
    });

    group('>Delete list', () {
      test('>checking', () async {
        Map result = await tmdb.v3.lists
            .deleteList('98097f2cd6af83f272ccbcfa93960723a940f87b', '134721');
        print(result);
        expect(result is Map, true);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.clearList(null, null);
        } catch (e) {
          expect(e is NullValueException, true);
        }
      });
    });
  });
}
