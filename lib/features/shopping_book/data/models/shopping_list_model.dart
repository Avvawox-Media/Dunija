import 'dart:convert';

import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';

// part 'shopping_list_model.g.dart';

// @HiveType()
class ShoppingListModel extends ShoppingList {
  // @HiveField(0)
  final String date;
  // @HiveField(1)
  final List<dynamic> items;
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

  String toJson() {
    Map<String, dynamic> map = {
      'title': listTitle,
      'items': items,
      'date': date,
    };
    return json.encode(map);
  }
}
