import '../entities/profile_entity.dart';
import '../repository/profile_repository.dart';

final class GetProfileUseCase {
  const GetProfileUseCase({required ProfileRepository repository}) : _repository = repository;

  final ProfileRepository _repository;

  Future<ProfileEntity> call() => _repository.getProfile();
}
