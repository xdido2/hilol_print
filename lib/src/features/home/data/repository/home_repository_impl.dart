import '../../domain/entities/home_item_entity.dart';
import '../../domain/repository/home_repository.dart';

final class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl();

  @override
  Future<List<HomeItemEntity>> getItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [
      HomeItemEntity(title: 'Welcome', subtitle: 'This is your initial project template.'),
      HomeItemEntity(title: 'Clean architecture', subtitle: 'data / domain / presentation layers ready.'),
      HomeItemEntity(title: 'No backend required', subtitle: 'Replace this with your real data source.'),
    ];
  }
}
