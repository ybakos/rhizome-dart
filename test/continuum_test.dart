import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A Continuum', () {
    Continuum continuum;
    final fakeThings = <Uri, Thing>{};

    setUp(() {
      continuum = Continuum(things: fakeThings);
    });

    test('has things', () {
      expect(continuum.things, equals(fakeThings));
    });

    test('has an empty initial list of things by default', () {
      expect(Continuum().things.isEmpty, isTrue);
    });
  });
}
