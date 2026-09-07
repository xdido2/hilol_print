import 'package:flutter/foundation.dart';

import '../../../../common/data/enums/bloc_status_enum.dart';
import '../../domain/entities/journal_entry_entity.dart';

@immutable
final class JournalCubitState {
  const JournalCubitState({
    this.status = Status.initial,
    this.entries = const <JournalEntryEntity>[],
    this.errorMessage,
  });

  final Status status;
  final List<JournalEntryEntity> entries;
  final String? errorMessage;

  JournalCubitState copyWith({Status? status, List<JournalEntryEntity>? entries, String? errorMessage}) =>
      JournalCubitState(status: status ?? this.status, entries: entries ?? this.entries, errorMessage: errorMessage);
}
