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

  Thing(
      {@required information,
      @required Uri uri,
      List<Uri> tags,
      List<Uri> targets})
      : _information = information,
        _uri = uri,
        _tags = tags ?? <Uri>[],
        _targets = targets ?? <Uri>[];

  /// `true` when this [Thing] is tagged by `tag`.
  bool isTaggedBy(Thing tag) => tags.contains(tag.uri);

  /// `true` when `target` is tagged with this [Thing].
  bool isTagging(Thing target) => targets.contains(target.uri);

  /// Tag this [Thing] with `tag`.
  ///
  /// Tagging is reciprocal, in that if Thing A is tagged with Thing B, then
  /// Thing A is informed it has been tagged with B, and B is informed that it
  /// tags A.
  void tagWith(Thing tag) {
    if (isTaggedBy(tag)) return;
    tags.add(tag.uri);
    tag.tag(this);
  }

  /// Tag `target` with this [Thing].
  ///
  /// Tagging is reciprocal, in that if Thing A tags Thing B, then A is informed
  /// that it tags B, and B is informed that it has been tagged with A.
  void tag(Thing target) {
    if (isTagging(target)) return;
    targets.add(target.uri);
    target.tagWith(this);
  }

  @override
  String toString() =>
    '${information}\t(${uri})\n'
    'Tags:    ${tags}\n'
    'Targets: ${targets}';
}
