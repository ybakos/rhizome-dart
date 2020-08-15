import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A Continuum', () {
    Continuum continuum;
    final things = <Uri, Thing>{};

    setUp(() {
      continuum = Continuum(things: things);
    });

    test('has things', () {
      expect(continuum.things, equals(things));
    });

    test('has an empty initial list of things by default', () {
      expect(Continuum().things.isEmpty, isTrue);
    });

    test('#retrieve returns a Thing associated with the provided URI', () {
      final uri = Uri();
      final thing = Thing(information: 'Fake');
      final continuum = Continuum(things: {uri: thing});
      expect(continuum.retrieve(uri), equals(thing));
    });

    test('#retrieve returns null when the URI does not exist', () {
      expect(continuum.retrieve(Uri()), isNull);
    });
  });
}
