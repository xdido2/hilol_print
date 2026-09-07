/// Text the recognizer read from one frame, split into visual lines.
final class RecognizedTextEntity {
  const RecognizedTextEntity({required this.lines});

  const RecognizedTextEntity.empty() : lines = const <String>[];

  final List<String> lines;

  bool get isEmpty => lines.isEmpty;
}
