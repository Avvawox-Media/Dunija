import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:dunija/features/shopping_list/domain/repositories/shopping_list_repository.dart';

class GetShoppingList extends Usecase<ShoppingList, Params> {
  final ShoppingListRepository shoppingListRepository;

  GetShoppingList(this.shoppingListRepository);

  @override
  Future<ShoppingList> call(params) async {
    return await shoppingListRepository.getShoppingList(id: params.itemId);
  }
}

class Params {
  final String itemId;

  Params(this.itemId);
}
