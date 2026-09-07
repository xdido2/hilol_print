import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../domain/entity/recognized_text_entity.dart';

/// DTO around the recognizer output, flattened to the visual lines the parser
/// actually needs.
final class RecognizedTextModel {
  const RecognizedTextModel({required this.lines});

  /// Blocks are visual paragraphs; a PAN or an expiry never spans two of them,
  /// so the block grouping is dropped and only the lines are kept.
  factory RecognizedTextModel.fromRecognizedText(RecognizedText text) => RecognizedTextModel(
    lines: <String>[
      for (final block in text.blocks)
        for (final line in block.lines) line.text,
    ],
  );

  final List<String> lines;

  RecognizedTextEntity toEntity() => RecognizedTextEntity(lines: lines);
}
