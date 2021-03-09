import 'package:dunija/features/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:meta/meta.dart';

abstract class ShoppingListRepository {
  ///Defines contract for Creating `[Shopping list`
  Future<bool> createShoppingList({
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required String itemId,
  });

  Future<ShoppingList> getShoppingList({@required String id});

  Future<List<ShoppingList>> getAllShoppingList();

  Future<bool> removeShoppingList(String id);

  Future<bool> updateShoppingList({
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required String itemId,
  });
}
