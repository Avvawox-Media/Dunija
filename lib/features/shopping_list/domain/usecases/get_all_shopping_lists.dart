import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:dunija/features/shopping_list/domain/repositories/shopping_list_repository.dart';

class GetAllShoppingLists extends Usecase<List<ShoppingList>, NoParams> {
  final ShoppingListRepository shoppingListRepository;

  GetAllShoppingLists(this.shoppingListRepository);

  @override
  Future<List<ShoppingList>> call(params) async {
    return await shoppingListRepository.getAllShoppingList();
  }
}

class NoParams {}
