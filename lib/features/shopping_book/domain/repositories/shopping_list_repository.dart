import 'package:dartz/dartz.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';
import 'package:meta/meta.dart';

abstract class ShoppingListRepository {
  ///Defines contract for Creating `[Shopping list`
  Future<Either<Failure, int>> createShoppingList({
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required DateTime date,
  });

  Future<Either<Failure, ShoppingList>> getShoppingList({@required int index});

  Future<Either<Failure, List<ShoppingList>>> getAllShoppingList();

  Future<Either<Failure, void>> removeShoppingList(final int index);

  Future<void> updateShoppingList({
    @required int index,
    @required String listTitle,
    @required List<Map<String, dynamic>> items,
    @required DateTime date,
  });
}
