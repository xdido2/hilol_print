import '../entities/journal_entry_entity.dart';

abstract interface class JournalRepository {
  Future<List<JournalEntryEntity>> getEntries();
}
