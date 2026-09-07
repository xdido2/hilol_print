import '../entities/home_item_entity.dart';

abstract interface class HomeRepository {
  Future<List<HomeItemEntity>> getItems();
}
