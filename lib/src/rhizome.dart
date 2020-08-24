import 'continuum.dart';
import 'repertory.dart';
import 'thing.dart';

/// A living distribution of all the world's information.
///
/// The Rhizome class provides the primary API for storing information,
/// retrieving a specific information object (a [Thing]), and seeking
/// information.
class Rhizome {
  final Continuum _continuum;
  final Repertory _repertory;

  Rhizome(
      {Continuum continuum, Repertory repertory})
      : _continuum = continuum ?? Continuum(),
        _repertory = repertory ?? Repertory();
  
  /// Retrieve the [Thing] indentified by `uri`.
  Thing retrieve(uri) => _continuum.retrieve(uri);
  
  /// Retrieve the [Thing] that represents `information`.
  Thing seek(dynamic information) => retrieve(_repertory.seek(information));
}
