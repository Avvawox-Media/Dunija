part of 'shopping_book_bloc.dart';

abstract class ShoppingBookEvent extends Equatable {
  const ShoppingBookEvent();

  @override
  List<Object> get props => [];
}

class CreateListEvent extends ShoppingBookEvent {
  final String listTitle;
  final List<Map<String, dynamic>> items;
  final DateTime date;

  CreateListEvent({this.listTitle, this.items, this.date});
}

class EditListEvent extends ShoppingBookEvent {
  final int key;
  final String listTitle;
  final List<Map<String, dynamic>> items;
  final String itemId;
  final DateTime date;

  EditListEvent(this.key, this.listTitle, this.items, this.itemId, this.date);
}

class GetListEvent extends ShoppingBookEvent {
  final int key;

  GetListEvent(this.key);
}

class GetAllListEvent extends ShoppingBookEvent {}

class RemoveListEvent extends ShoppingBookEvent {
  final int key;

  RemoveListEvent(this.key);
}
