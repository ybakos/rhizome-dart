import 'package:meta/meta.dart';

/// An information object.
///
/// A Thing elevates a piece of raw information into an object, in the sense of
/// "information as thing" (Buckland, 1991).
class Thing {

  final _information;
  /// The raw information itself. For example, [Rhizome] represents a photograph
  /// as a [Thing] whose information is the photograph itself. 
  dynamic get information => _information;

  final Uri _uri;
  /// A permanentily unique identifier.
  Uri get uri => _uri;

  final List<Uri> _tags;
  /// A list of the URIs of other [Thing]s that this [Thing] is tagged with.
  List<Uri> get tags => _tags;

  final List<Uri> _targets;
  /// A list of the URIs of other [Thing]s that have been tagged with this
  /// [Thing].
  List<Uri> get targets => _targets;

  const Thing(
      {@required information,
      @required Uri uri,
      List<Uri> tags = const <Uri>[],
      List<Uri> targets = const <Uri>[]})
      : _information = information,
        _uri = uri,
        _tags = tags,
        _targets = targets;

  bool isTaggedBy(Thing tag) => tags.contains(tag.uri);
  bool isTagging(Thing target) => targets.contains(target.uri);

}