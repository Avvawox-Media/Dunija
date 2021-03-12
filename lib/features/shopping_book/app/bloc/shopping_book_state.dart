part of 'shopping_book_bloc.dart';

abstract class ShoppingBookState extends Equatable {
  const ShoppingBookState();

  @override
  List<Object> get props => [];
}

class ShoppingBookInitial extends ShoppingBookState {}

class ShoppingBookLoading extends ShoppingBookState {}

class ShoppingBookCreated extends ShoppingBookState {
  final int index;

  ShoppingBookCreated(this.index);
}

class ShoppingBookLoaded extends ShoppingBookState {
  final List<ShoppingList> shoppingList;

  ShoppingBookLoaded(this.shoppingList);
}

class ShoppingBookEdited extends ShoppingBookState {}

class ShoppingListDeleted extends ShoppingBookState {}

class ShoppingBookError extends ShoppingBookState {
  final Failure failure;

  ShoppingBookError(this.failure);
}
