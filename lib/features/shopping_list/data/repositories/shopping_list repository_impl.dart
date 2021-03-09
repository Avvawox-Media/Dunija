import 'package:dunija/core/errors/exceptions.dart';
import 'package:dunija/features/shopping_list/data/sources/shopping_list_data_source.dart';
import 'package:dunija/features/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:dunija/features/shopping_list/domain/repositories/shopping_list_repository.dart';

class ShoppingListRepositoryImpl implements ShoppingListRepository {
  final ShoppingListDataSourceImpl shoppingListDataSourceImpl;

  ShoppingListRepositoryImpl(this.shoppingListDataSourceImpl);
  @override
  Future<bool> createShoppingList(
      {String listTitle,
      List<Map<String, dynamic>> items,
      String itemId}) async {
    try {
      return await shoppingListDataSourceImpl.createShoppingList(
        listTitle: listTitle,
        items: items,
        itemId: itemId,
      );
    } on DatabaseException {
      // return DatabaseFailure(failure, details);
    }
  }

  @override
  Future<List<ShoppingList>> getAllShoppingList() async {
    try {
      return await shoppingListDataSourceImpl.getAllShoppingList();
    } on DatabaseException {
      // return DatabaseFailure(failure, details);
    }
  }

  @override
  Future<ShoppingList> getShoppingList({String id}) async {
    try {
      return await shoppingListDataSourceImpl.getShoppingList(id);
    } on DatabaseException {
      // return DatabaseFailure(failure, details);
    }
  }

  @override
  Future<bool> removeShoppingList(String id) async {
    try {
      return await shoppingListDataSourceImpl.removeShoppingList(itemId: id);
    } on DatabaseException {
      // return DatabaseFailure(failure, details);
    }
  }

  @override
  Future<bool> updateShoppingList(
      {String listTitle,
      List<Map<String, dynamic>> items,
      String itemId}) async {
    try {
      return await shoppingListDataSourceImpl.updateShoppingList(
        itemId: itemId,
        items: items,
        listTitle: listTitle,
      );
    } on DatabaseException {
      // return DatabaseFailure(failure, details);
    }
  }
}
