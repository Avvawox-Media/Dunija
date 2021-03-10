import 'package:equatable/equatable.dart';

class ShoppingList extends Equatable {
  final String listTitle;
  final List<Map<String, dynamic>> items;
  final DateTime date;

  const ShoppingList(this.listTitle, this.items, this.date);

  @override
  List<Object> get props => [listTitle, items, date];
}
