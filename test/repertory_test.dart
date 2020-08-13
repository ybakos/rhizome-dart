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

    test('#seek returns the Uri of a Thing for existing information', () {
      final information = 'Fake';
      final uri = Uri();
      repertory = Repertory(index: {information: uri});
      expect(repertory.seek(information), equals(uri));
    });

    test('#seek returns null when the information does not exist', () {
      expect(repertory.seek('Does not exist'), isNull);
    });

  });
}
