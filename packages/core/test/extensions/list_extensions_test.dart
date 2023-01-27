import 'package:core/extensions/list_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('firstOrNull', () {
    test(
      'when list contains element, return the first match',
      () {
        final list = [1, 2, 3];
        final result = list.firstOrNull((num) => num == 2);
        expect(result, 2);
      },
    );
    test(
      'when list does not contain element, return null',
      () {
        final list = [1, 2, 3];
        final result = list.firstOrNull((num) => num == 4);
        expect(result, null);
      },
    );
  });

  group('findAndReplace', () {
    test(
      'when list contain element update it and return a different list',
      () {
        final list = [1, 2, 3, 4, 5];
        final result = list.findAndReplace(
          find: (item) => item == 2,
          replace: (item) => item * 2,
        );
        expect(result, [1, 4, 3, 4, 5]);
      },
    );
  });
}
