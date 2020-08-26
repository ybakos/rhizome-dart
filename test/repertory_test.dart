import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A Repertory', () {
    Repertory repertory;
    final index = <dynamic, Uri>{};

    setUp(() {
      repertory = Repertory(index: index);
    });

    test('has an index', () {
      expect(repertory.index, equals(index));
    });

    test('has an empty initial index by default', () {
      expect(Repertory().index.isEmpty, isTrue);
    });

    test('#seek returns the Uri of a Thing for existing information', () {
      final information = 'Fake';
      final uri = Uri();
      final repertory = Repertory(index: {information: uri});
      expect(repertory.seek(information), equals(uri));
    });

    test('#seek returns null when the information does not exist', () {
      expect(repertory.seek('Does not exist'), isNull);
    });

    test('#register does nothing when the Thing is already indexed', () {
      final information = 'Fake';
      final uri = Uri();
      final thing = Thing(information: information, uri: uri);
      final repertory = Repertory(index: {thing.information: thing.uri});
      expect(repertory.index.length, equals(1));
      repertory.register(thing);
      expect(repertory.index.length, equals(1));
    });

    test('#register a Thing adds it to the index', () {
      final information = 'Fake';
      final uri = Uri();
      final thing = Thing(information: information, uri: uri);
      final repertory = Repertory(index: <dynamic, Uri>{});
      repertory.register(thing);
      expect(repertory.index.containsKey(information), isTrue);
      expect(repertory.index[information], equals(uri));
    });
  });
}
