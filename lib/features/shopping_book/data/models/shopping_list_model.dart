import 'dart:convert';

import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';

// part 'shopping_list_model.g.dart';

// @HiveType()
class ShoppingListModel extends ShoppingList {
  // @HiveField(0)
  final DateTime date;
  // @HiveField(1)
  final List<Map<String, dynamic>> items;
  // @HiveField(2)
  final String listTitle;

  ShoppingListModel({this.date, this.items, this.listTitle})
      : super(listTitle, items, date);

  factory ShoppingListModel.fromJson(String jsonString) {
    final result = json.decode(jsonString);
    return ShoppingListModel(
        listTitle: result['title'],
        items: result['items'],
        date: result['date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': listTitle,
      'items': items,
      'date': date,
    };
  }

  String toJsonString(ShoppingListModel shoppingListModel) {
    Map<String, dynamic> map = {
      'title': shoppingListModel.listTitle,
      'items': shoppingListModel.items,
      'date': shoppingListModel.date,
    };
    return json.encode(map);
  }
}
