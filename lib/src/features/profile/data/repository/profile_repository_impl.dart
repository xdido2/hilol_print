import '../../domain/entities/profile_entity.dart';
import '../../domain/repository/profile_repository.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl();

  @override
  Future<ProfileEntity> getProfile() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return const ProfileEntity(username: 'udevs', fullName: 'Initial Project User');
  }
}
