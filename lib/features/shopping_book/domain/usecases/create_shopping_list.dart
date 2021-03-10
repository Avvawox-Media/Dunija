import 'package:dartz/dartz.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_book/domain/repositories/shopping_list_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CreateShoppingList extends Usecase<int, ShoppingListParams> {
  final ShoppingListRepository shoppingListRepository;

  CreateShoppingList(this.shoppingListRepository);

  @override
  Future<Either<Failure, int>> call(params) async {
    return await shoppingListRepository.createShoppingList(
      listTitle: params.listTitle,
      date: params.date,
      items: params.items,
    );
  }
}

class ShoppingListParams extends Equatable {
  final String listTitle;
  final List<Map<String, dynamic>> items;
  final DateTime date;

  const ShoppingListParams({
    @required this.listTitle,
    @required this.items,
    @required this.date,
  });

  @override
  List<Object> get props => [date, listTitle, items];
}
