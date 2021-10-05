@Skip('Only manual tests are possible')
import 'package:test/test.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../init_script.dart';

void main() {
  final tmdb = TMDB(ApiKeys(Keys.API!, Keys.API_V4!));
  group('Lists', () {
    group('>details', () {
      test('>get Details', () async {
        final result =
            await tmdb.v3.lists.getDetails('50941077760ee35e1500000c');
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.getDetails(null);
        } catch (e) {
          expect(e is ArgumentError, true);
        }
      });
    });

    group('>Check item status', () {
      test('>checking', () async {
        final result = await tmdb.v3.lists
            .checkItemStatus('50941077760ee35e1500000c', 123);
        expect(result is Map, true);
        expect(result.containsKey('status_code'), false);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.checkItemStatus(null, null);
        } catch (e) {
          expect(e is ArgumentError, true);
        }
      });
    });
    group('>Create list', () {
      test('>checking', () async {
        final result = await tmdb.v3.lists.createList(
          '21b318c9b6fbaa28c62cb3a60796ad3b481fd20a',
          'testing this api',
          'lol move time',
        );

        expect(result is Map, true);
        expect(result.containsKey('list_id'), true);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.checkItemStatus(null, null);
        } catch (e) {
          expect(e is ArgumentError, true);
        }
      });
    });
    group('>Add movie', () {
      test('>checking', () async {
        final result = await tmdb.v3.lists
            .addItem('21b318c9b6fbaa28c62cb3a60796ad3b481fd20a', '134721', 12);
        expect(result is Map, true);
        print(result);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.addItem(null, null, null);
        } catch (e) {
          expect(e is ArgumentError, true);
        }
      });
    });
    group('>Remove item', () {
      test('>checking', () async {
        final result = await tmdb.v3.lists.removeItem(
          '98097f2cd6af83f272ccbcfa93960723a940f87b',
          '134721',
          12,
        );
        expect(result is Map, true);
        // expect(result['status_message'],
        //     'The item/record was updated successfully.');
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.removeItem(null, null, null);
        } catch (e) {
          expect(e is ArgumentError, true);
        }
      });
    });

    group('>Clear list', () {
      test('>checking', () async {
        final result = await tmdb.v3.lists
            .clearList('98097f2cd6af83f272ccbcfa93960723a940f87b', '134721');
        expect(result is Map, true);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.clearList(null, null);
        } catch (e) {
          expect(e is ArgumentError, true);
        }
      });
    });

    group('>Delete list', () {
      test('>checking', () async {
        final result = await tmdb.v3.lists
            .deleteList('98097f2cd6af83f272ccbcfa93960723a940f87b', '134721');
        expect(result is Map, true);
      });
      test('>Null value', () async {
        try {
          await tmdb.v3.lists.clearList(null, null);
        } catch (e) {
          expect(e is ArgumentError, true);
        }
      });
    });
  });
}
