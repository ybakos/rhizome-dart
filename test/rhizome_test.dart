import 'package:test/test.dart';
import 'package:rhizome/rhizome.dart';

void main() {
  group('A Rhizome', () {
    Rhizome rhizome;

    setUp(() {
      rhizome = Rhizome();
    });

    test('#retrieve returns a Thing given its URI', () {
      final uri = Uri();
      final thing = Thing(information: 'Fake', uri: uri);
      final rhizome = Rhizome(continuum: Continuum(things: {uri: thing}));
      expect(rhizome.retrieve(uri), equals(thing));
    });

    test('#retrieve returns null when no Thing with a URI exists', () {
      final uri = Uri();
      expect(rhizome.retrieve(uri), isNull);
    });

    test('#seek returns a Thing given its information', () {
      final information = 'Fake';
      final uri = Uri();
      final thing = Thing(information: information, uri: uri);
      final rhizome = Rhizome(
          continuum: Continuum(things: {uri: thing}),
          repertory: Repertory(index: {information: uri}));
      expect(rhizome.seek(information), equals(thing));
    });

    test('#seek returns null when the information does not exist', () {
      expect(rhizome.seek('Fake'), isNull);
    });

    test('#store returns a new Thing with a new URI, given new information', () {
      final information = 'Fake';
      final newThing = rhizome.store(information);
      expect(newThing.information, equals(information));
      expect(newThing.uri, isNotNull);
    });

    test('#store returns an existing Thing, given existing information', () {
      final information = 'Fake';
      final uri = Uri();
      final thing = Thing(information: information, uri: uri);
      final rhizome = Rhizome(
          continuum: Continuum(things: {uri: thing}),
          repertory: Repertory(index: {information: uri}));
      expect(rhizome.store(information), equals(thing));
    });

    test('WIP: #query of an empty Rhizome returns an empty list', () {
      expect(rhizome.query().length, equals(0));
    });

    test('WIP: #query returns a list of every Thing', () {
      final first = rhizome.store('Fake 1');
      final second = rhizome.store('Fake 2');
      expect(rhizome.query().length, equals(2));
      expect(rhizome.query().contains(first), isTrue);
      expect(rhizome.query().contains(second), isTrue);
    });
  });
}
