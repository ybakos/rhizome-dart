import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A group of tests', () {
    String fakeInformation = 'Fake';
    Uri fakeUri = Uri();
    Thing thing;

    setUp(() {
      thing = Thing(information: fakeInformation, uri: fakeUri);
    });

    test('A Thing has information and a uri', () {
      expect(thing.information, equals(fakeInformation));
      expect(thing.uri, equals(fakeUri));
    });

    test('A new Thing has no tags', () {
      expect(thing.tags.isEmpty, isTrue);
    });

    test('A new Thing has no targets', () {
      expect(thing.targets.isEmpty, isTrue);
    });

  });
}
