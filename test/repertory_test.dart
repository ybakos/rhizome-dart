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
      final repertory = Repertory(index: {information: uri});
      expect(repertory.seek(information), equals(uri));
    });

    test('#seek returns null when the information does not exist', () {
      expect(repertory.seek('Does not exist'), isNull);
    });

    test('#register does nothing when the Thing is already indexed', () {
      final fakeInformation = 'Fake';
      final fakeUri = Uri();
      final fakeThing = Thing(information: fakeInformation, uri: fakeUri);
      final repertory = Repertory(index: {fakeThing.information: fakeThing.uri});
      expect(repertory.index.length, equals(1));
      repertory.register(fakeThing);
      expect(repertory.index.length, equals(1));
    });

    test('#register a Thing adds it to the index', () {
      final fakeInformation = 'Fake';
      final fakeUri = Uri();
      final fakeThing = Thing(information: fakeInformation, uri: fakeUri);
      final repertory = Repertory(index: <dynamic, Uri>{});
      repertory.register(fakeThing);
      expect(repertory.index.containsKey(fakeInformation), isTrue);
      expect(repertory.index[fakeInformation], equals(fakeUri));
    });

  });
}
