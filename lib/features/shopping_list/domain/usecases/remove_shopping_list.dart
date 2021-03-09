import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_list/domain/repositories/shopping_list_repository.dart';

class RemoveShoppingList extends Usecase<bool, Params> {
  final ShoppingListRepository shoppingListRepository;

  RemoveShoppingList(this.shoppingListRepository);

  @override
  Future<bool> call(params) async {
    return await shoppingListRepository.removeShoppingList(params.itemId);
  }
}

class Params {
  final String itemId;

  Params(this.itemId);
}
