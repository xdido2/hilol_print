import '../entities/home_item_entity.dart';
import '../repository/home_repository.dart';

final class GetHomeItemsUseCase {
  const GetHomeItemsUseCase({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  final HomeRepository _homeRepository;

  Future<List<HomeItemEntity>> call() => _homeRepository.getItems();
}
