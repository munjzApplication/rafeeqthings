import 'package:bloc_operations/model/favorites_item_model.dart';

class FavoriteRepository {
  Future<List<FavoritesItemModel>> fetchLIstItems() async {
    await Future.delayed(const Duration(seconds: 2));

    return List.of(_generatedList(length: 10));
  }

  List<FavoritesItemModel> _generatedList({required int length}) {
    return List.generate(
        length,
        (index) =>
            FavoritesItemModel(id: index.toString(), value: "Item $index"));
  }
}
