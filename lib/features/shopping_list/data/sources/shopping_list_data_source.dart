import 'package:dunija/features/shopping_list/data/models/shopping_list_model.dart';
import 'package:meta/meta.dart';

abstract class ShoppingListDataSource {
  ///* [CreatesShppingList]
  Future<bool> createShoppingList({
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required String itemId,
  });

  ///* [GetShoppingList] with a specific [itemId]
  Future<ShoppingListModel> getShoppingList(String itemId);

  ///* [UpdateShoppingList] item possessing a specified [itemId]
  ///* with [listTitle], and [items] contained in the list
  Future<bool> updateShoppingList({
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required String itemId,
  });

  ///* [GetAllShoppingList]
  Future<ShoppingListModel> getAllShoppingList();

  ///* [RemoveShoppingList] item possessing a specified [itemId]
  Future<bool> removeShoppingList({
    @required String itemId,
  });
}

class ShoppingListDataSourceImpl implements ShoppingListDataSource {
  //final Hive Database Instance
  @override
  Future<bool> createShoppingList(
      {String listTitle, List<Map<String, dynamic>> items, String itemId}) {
    // TODO: implement createShoppingList
    throw UnimplementedError();
  }

  @override
  Future<ShoppingListModel> getAllShoppingList() {
    // TODO: implement getAllShoppingList
    throw UnimplementedError();
  }

  @override
  Future<ShoppingListModel> getShoppingList(String itemId) {
    // TODO: implement getShoppingList
    throw UnimplementedError();
  }

  @override
  Future<bool> removeShoppingList({String itemId}) {
    // TODO: implement removeShoppingList
    throw UnimplementedError();
  }

  @override
  Future<bool> updateShoppingList(
      {String listTitle, List<Map<String, dynamic>> items, String itemId}) {
    // TODO: implement updateShoppingList
    throw UnimplementedError();
  }
}
