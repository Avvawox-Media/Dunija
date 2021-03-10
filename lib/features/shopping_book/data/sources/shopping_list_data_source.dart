import 'package:dunija/core/database/database_helper.dart';
import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/features/shopping_book/data/models/shopping_list_model.dart';
import 'package:meta/meta.dart';

abstract class ShoppingListDataSource {
  ///* [CreatesShppingList]
  Future<int> createShoppingList({
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required DateTime date,
  });

  ///* [GetShoppingList] with a specific [itemId]
  Future<ShoppingListModel> getShoppingList(int itemId);

  ///* [UpdateShoppingList] item possessing a specified [itemId]
  ///* with [listTitle], and [items] contained in the list
  Future<void> updateShoppingList({
    @required int index,
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required DateTime date,
  });

  ///* [GetAllShoppingList]
  Future<List<ShoppingListModel>> getAllShoppingList();

  ///* [RemoveShoppingList] item possessing a specified [index]
  Future<void> removeShoppingList({
    @required int index,
  });
}

/////////////////////////////////////////////////////////////////////
///Shopping List Data Source Implementation
////////////////////////////////////////////////////////////////////

class ShoppingListDataSourceImpl implements ShoppingListDataSource {
  final DatabaseHelper databaseHelper;

  ShoppingListDataSourceImpl(this.databaseHelper);

  @override
  Future<int> createShoppingList({
    String listTitle,
    List<Map<String, dynamic>> items,
    DateTime date,
  }) {
    final shoppingListModel = ShoppingListModel(
      listTitle: listTitle,
      items: items,
      date: date,
    );
    return databaseHelper.save(
      SHOPPING_BOOK,
      shoppingListModel,
    );
  }

  @override
  Future<ShoppingListModel> getShoppingList(int index) async {
    return await databaseHelper.getItem(
      index,
      SHOPPING_BOOK,
    ) as ShoppingListModel;
  }

  @override
  Future<List<ShoppingListModel>> getAllShoppingList() async {
    List<ShoppingListModel> shoppingListModel = [];

    List<String> jsonStringList =
        await databaseHelper.getAllItem(SHOPPING_BOOK);

    for (String value in jsonStringList) {
      shoppingListModel.add(ShoppingListModel.fromJson(value));
    }

    return shoppingListModel;
  }

  @override
  Future<void> removeShoppingList({int index}) async {
    return await databaseHelper.remove(index, SHOPPING_BOOK);
  }

  @override
  Future<void> updateShoppingList({
    @required final int index,
    String listTitle,
    List<Map<String, dynamic>> items,
    DateTime date,
  }) async {
    final shoppingList = ShoppingListModel(
      listTitle: listTitle,
      items: items,
      date: date,
    );
    return await databaseHelper.update(
      index,
      SHOPPING_BOOK,
      shoppingList,
    );
  }
}
