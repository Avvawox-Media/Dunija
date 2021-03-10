import 'package:dartz/dartz.dart';
import 'package:dunija/core/errors/exceptions.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/features/shopping_book/data/sources/shopping_list_data_source.dart';
import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';
import 'package:dunija/features/shopping_book/domain/repositories/shopping_list_repository.dart';

class ShoppingListRepositoryImpl implements ShoppingListRepository {
  final ShoppingListDataSourceImpl shoppingListDataSourceImpl;

  ShoppingListRepositoryImpl(this.shoppingListDataSourceImpl);
  @override
  Future<Either<Failure, int>> createShoppingList({
    String listTitle,
    List<Map<String, dynamic>> items,
    DateTime date,
  }) async {
    try {
      return Right(await shoppingListDataSourceImpl.createShoppingList(
        listTitle: listTitle,
        items: items,
        date: date,
      ));
    } on DatabaseException {
      return Left(
        DatabaseFailure('Internal Error', 'Could not perform action'),
      );
    }
  }

  @override
  Future<Either<Failure, ShoppingList>> getShoppingList({int index}) async {
    try {
      return Right(
        await shoppingListDataSourceImpl.getShoppingList(index),
      );
    } on DatabaseException {
      return Left(
        DatabaseFailure('Internal Error', 'Could not perform action'),
      );
    }
  }

  @override
  Future<Either<Failure, List<ShoppingList>>> getAllShoppingList() async {
    try {
      return Right(
        await shoppingListDataSourceImpl.getAllShoppingList(),
      );
    } on DatabaseException {
      return Left(
        DatabaseFailure('Internal Error', 'Could not perform action'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeShoppingList(int index) async {
    try {
      return Right(
        await shoppingListDataSourceImpl.removeShoppingList(index: index),
      );
    } on DatabaseException {
      return Left(
        DatabaseFailure('Internal Error', 'Could not perform action'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateShoppingList({
    int index,
    String listTitle,
    List<Map<String, dynamic>> items,
    DateTime date,
  }) async {
    try {
      return Right(await shoppingListDataSourceImpl.updateShoppingList(
        index: index,
        date: date,
        items: items,
        listTitle: listTitle,
      ));
    } on DatabaseException {
      return Left(
        DatabaseFailure('Internal Error', 'Could not perform action'),
      );
    }
  }
}
