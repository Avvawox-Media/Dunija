import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_list/domain/repositories/shopping_list_repository.dart';

class EditShoppingList extends Usecase<bool, Params> {
  final ShoppingListRepository shoppingListRepository;

  EditShoppingList(this.shoppingListRepository);

  @override
  Future<bool> call(params) async {
    return await shoppingListRepository.updateShoppingList(
      itemId: params.itemId,
      items: params.items,
      listTitle: params.listTitle,
    );
  }
}

class Params {
  final String itemId;
  final String listTitle;
  final List<Map<String, dynamic>> items;

  Params(this.itemId, this.listTitle, this.items);
}
