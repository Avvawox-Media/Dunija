import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_list/domain/repositories/shopping_list_repository.dart';
import 'package:meta/meta.dart';

class CreateShoppingList extends Usecase<bool, ShoppingListParams> {
  final ShoppingListRepository shoppingListRepository;

  CreateShoppingList(this.shoppingListRepository);

  @override
  Future<bool> call(params) async {
    return await shoppingListRepository.createShoppingList(
      listTitle: params.listTitle,
      itemId: params.itemId,
      items: params.items,
    );
  }
}

class ShoppingListParams {
  final String listTitle;
  final List<Map<String, dynamic>> items;
  final String itemId;

  const ShoppingListParams({
    @required this.listTitle,
    @required this.items,
    @required this.itemId,
  });
}
