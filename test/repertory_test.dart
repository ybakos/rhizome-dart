import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A Repertory', () {
    Repertory repertory;
    final fakeIndex = <dynamic, Uri>{};

    setUp(() {
      repertory = Repertory(index: fakeIndex);
    });

    test('has an index', () {
      expect(repertory.index, equals(fakeIndex));
    });

    test('has an empty initial index by default', () {
      expect(Repertory().index.isEmpty, isTrue);
    });

  });
}
