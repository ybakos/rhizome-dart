import 'thing.dart';

/// A searchable catalog of information.
/// 
/// Inspired by Otlet's Repertoire Bibliographique Universel (RBU), a Repertory
/// is an index that maps information to [Thing]s, and provides an API for
/// registering and seeking [Thing]s.
class Repertory {

  final Map<dynamic, Uri> _index;
  /// A key-value store mapping information to URIs of [Thing]s.
  Map<dynamic, Uri> get index => _index;

  Repertory({Map<dynamic, Uri> index}) : _index = index ?? <dynamic, Uri>{};

  /// Retrieve the Uri of a [Thing] that represents `information`.
  Uri seek(dynamic information) {
    return _index[information];
  }
  
  /// Add a [Thing] to the repertory.
  void register(Thing thing) {
    if (_index.containsKey(thing.information)) return;
    _index[thing.information] = thing.uri;
  }

}
