import 'continuum.dart';

/// A living distribution of all the world's information.
/// 
/// The Rhizome class provides the primary API for storing information,
/// retrieving a specific information object (a [Thing]), and seeking
/// information.
class Rhizome {
  
  final Continuum continuum;

  Rhizome({this.continuum = const Continuum()});

}
