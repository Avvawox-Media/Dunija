import 'package:dartz/dartz.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_book/domain/repositories/shopping_list_repository.dart';
import 'package:equatable/equatable.dart';

class RemoveShoppingList extends Usecase<void, RemoveListParams> {
  final ShoppingListRepository shoppingListRepository;

  RemoveShoppingList(this.shoppingListRepository);

  @override
  Future<Either<Failure, void>> call(params) async {
    return await shoppingListRepository.removeShoppingList(params.index);
  }
}

class RemoveListParams extends Equatable {
  final int index;

  RemoveListParams(this.index);

  @override
  List<Object> get props => [];
}
