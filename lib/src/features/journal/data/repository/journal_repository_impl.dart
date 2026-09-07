import '../../domain/entities/journal_entry_entity.dart';
import '../../domain/repository/journal_repository.dart';

final class JournalRepositoryImpl implements JournalRepository {
  const JournalRepositoryImpl();

  @override
  Future<List<JournalEntryEntity>> getEntries() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const [
      JournalEntryEntity(id: '1', title: 'First entry', note: 'A sample journal entry.'),
      JournalEntryEntity(id: '2', title: 'Second entry', note: 'Replace this with real data.'),
    ];
  }
}
