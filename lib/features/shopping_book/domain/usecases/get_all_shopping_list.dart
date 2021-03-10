import 'package:dartz/dartz.dart';
import 'package:dunija/core/failures/failures.dart';
import 'package:dunija/core/usecase/usecase.dart';
import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';
import 'package:dunija/features/shopping_book/domain/repositories/shopping_list_repository.dart';
import 'package:equatable/equatable.dart';

class GetAllShoppingList extends Usecase<List<ShoppingList>, GetAllListParams> {
  final ShoppingListRepository shoppingListRepository;

  GetAllShoppingList(this.shoppingListRepository);

  @override
  Future<Either<Failure, List<ShoppingList>>> call(params) async {
    return await shoppingListRepository.getAllShoppingList();
  }
}

class GetAllListParams extends Equatable {
  @override
  List<Object> get props => [];
}
