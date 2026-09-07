import '../entities/journal_entry_entity.dart';
import '../repository/journal_repository.dart';

final class GetJournalEntriesUseCase {
  const GetJournalEntriesUseCase({required JournalRepository repository}) : _repository = repository;

  final JournalRepository _repository;

  Future<List<JournalEntryEntity>> call() => _repository.getEntries();
}
