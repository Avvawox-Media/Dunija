import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';
import 'package:dunija/features/shopping_book/domain/usecases/create_shopping_list.dart';
import 'package:dunija/features/shopping_book/domain/usecases/edit_shopping_list.dart';
import 'package:dunija/features/shopping_book/domain/usecases/get_all_shopping_list.dart';
import 'package:dunija/features/shopping_book/domain/usecases/get_shopping_list.dart';
import 'package:dunija/features/shopping_book/domain/usecases/remove_shopping_list.dart';
import 'package:equatable/equatable.dart';

part 'shopping_book_event.dart';
part 'shopping_book_state.dart';

class ShoppingBookBloc extends Bloc<ShoppingBookEvent, ShoppingBookState> {
  final CreateShoppingList createShoppingList;
  final EditShoppingList editShoppingList;
  final GetShoppingList getShoppingList;
  final GetAllShoppingList getAllShoppingList;
  final RemoveShoppingList removeShoppingList;
  ShoppingBookBloc({
    this.getAllShoppingList,
    this.createShoppingList,
    this.editShoppingList,
    this.getShoppingList,
    this.removeShoppingList,
  }) : super(ShoppingBookInitial());

  @override
  Stream<ShoppingBookState> mapEventToState(
    ShoppingBookEvent event,
  ) async* {
    if (event is CreateListEvent) {
      //Emit Loading State
      yield ShoppingBookLoading();

      final shoppingListOrFailure = await createShoppingList(ShoppingListParams(
        listTitle: event.listTitle,
        items: event.items,
        date: event.date,
      ));

      yield shoppingListOrFailure.fold(
        (failure) => ShoppingBookError(failure),
        (index) => ShoppingBookCreated(index),
      );
    } else if (event is EditListEvent) {
      //Emit Loading State
      yield ShoppingBookLoading();

      final shoppingListOrFailure = await editShoppingList(
        EditListParams(
          listTitle: event.listTitle,
          items: event.items,
          date: event.date,
        ),
      );

      yield shoppingListOrFailure.fold(
        (failure) => ShoppingBookError(failure),
        (_) => ShoppingBookEdited(),
      );
    } else if (event is GetListEvent) {
      //Emit Loading State
      yield ShoppingBookLoading();

      final shoppingListOrFailure = await getAllShoppingList(
        GetAllListParams(),
      );

      yield shoppingListOrFailure.fold(
        (failure) => ShoppingBookError(failure),
        (shoppingList) => ShoppingBookLoaded(shoppingList),
      );
    } else if (event is RemoveListEvent) {
      //Emit Loading State
      yield ShoppingBookLoading();

      final deleteListOrFailure = await getShoppingList(
        GetListParams(event.key),
      );

      yield deleteListOrFailure.fold(
        (failure) => ShoppingBookError(failure),
        (shoppingList) => ShoppingBookDeleted(),
      );
    }
  }
}
