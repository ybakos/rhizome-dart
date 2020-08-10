import 'continuum.dart';
import 'repertory.dart';

/// A living distribution of all the world's information.
///
/// The Rhizome class provides the primary API for storing information,
/// retrieving a specific information object (a [Thing]), and seeking
/// information.
class Rhizome {
  final Continuum continuum;
  final Repertory repertory;

  Rhizome(
      {this.continuum = const Continuum(), repertory}) : this.repertory = repertory ?? Repertory();
}
