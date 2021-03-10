import 'package:dartz/dartz.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';
import 'package:dunija/features/shopping_book/domain/repositories/shopping_list_repository.dart';
import 'package:equatable/equatable.dart';

class GetShoppingList extends Usecase<ShoppingList, GetListParams> {
  final ShoppingListRepository shoppingListRepository;

  GetShoppingList(this.shoppingListRepository);

  @override
  Future<Either<Failure, ShoppingList>> call(params) async {
    return await shoppingListRepository.getShoppingList(index: params.index);
  }
}

class GetListParams extends Equatable {
  final int index;

  GetListParams(this.index);

  @override
  List<Object> get props => [index];
}
