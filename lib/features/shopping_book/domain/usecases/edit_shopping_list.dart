import 'package:dartz/dartz.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_book/domain/repositories/shopping_list_repository.dart';
import 'package:equatable/equatable.dart';

class EditShoppingList extends Usecase<void, EditListParams> {
  final ShoppingListRepository shoppingListRepository;

  EditShoppingList(this.shoppingListRepository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return Right(await shoppingListRepository.updateShoppingList(
      index: params.index,
      items: params.items,
      listTitle: params.listTitle,
      date: params.date,
    ));
  }
}

class EditListParams extends Equatable {
  final int index;
  final String listTitle;
  final List<Map<String, dynamic>> items;
  final String date;

  EditListParams({
    this.date,
    this.listTitle,
    this.items,
    this.index,
  });

  @override
  List<Object> get props => [index, listTitle, items];
}
