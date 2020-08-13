import 'thing.dart';

/// A searchable catalog of information.
/// 
/// Inspired by Otlet's Repertoire Bibliographique Universel (RBU), a Repertory
/// is an index that maps information to [Thing]s, and provides an API for
/// registering and seeking [Thing]s.
class Repertory {

  final Map<dynamic, Uri> _index;
  Map<dynamic, Uri> get index => _index;

  Repertory({index}) : _index = index ?? <dynamic, Uri>{};

  Uri seek(dynamic information) {
    return _index[information];
  }
  
}
