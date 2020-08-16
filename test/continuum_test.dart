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
      final thing = Thing(information: 'Fake', uri: uri);
      final continuum = Continuum(things: {uri: thing});
      expect(continuum.retrieve(uri), equals(thing));
    });

    test('#retrieve returns null when the URI does not exist', () {
      expect(continuum.retrieve(Uri()), isNull);
    });

    test('#store stores and returns a new thing with a URI', () {
      final information = 'Fake information';
      final newThing = continuum.store(information);
      expect(continuum.things[newThing.uri].information, equals(information));
    });
  });
}
