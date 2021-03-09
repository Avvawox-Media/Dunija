import 'dart:convert';

import 'package:dunija/features/shopping_list/domain/entities/shopping_list_entity.dart';

class ShoppingListModel extends ShoppingList {
  ShoppingListModel(
      String listTitle, List<Map<String, dynamic>> items, String itemId)
      : super(listTitle, items, itemId);

  factory ShoppingListModel.fromJson(String jsonString) {
    final result = json.decode(jsonString);
    return ShoppingListModel(
        result['title'], result['items'], result['item_id']);
  }

  Map<String, dynamic> toJson(ShoppingListModel listModel) {
    return {
      'title': listModel.listTitle,
      'items': listModel.items,
      'item_id': listModel.itemId,
    };
  }
}
