import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A group of tests', () {
    Rhizome rhizome;

    setUp(() {
      rhizome = Rhizome();
    });

    test('The rhizome exists', () {
      // no op
    });

    test('#retrieve returns a Thing given its URI', () {
      final uri = Uri();
      final thing = Thing(information: 'Fake', uri: uri);
      final rhizome = Rhizome(
        continuum: Continuum(things: {uri: thing})
      );
      expect(rhizome.retrieve(uri), equals(thing));
    });

    test('#retrieve returns null when no Thing with a URI exists', () {
      final uri = Uri();
      expect(rhizome.retrieve(uri), isNull);
    });
  });
}
