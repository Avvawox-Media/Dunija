import 'package:dunija/core/database/database_helper.dart';
import 'package:dunija/features/shopping_book/data/repositories/shopping_list%20repository_impl.dart';
import 'package:dunija/features/shopping_book/data/sources/shopping_list_data_source.dart';
import 'package:dunija/features/shopping_book/domain/repositories/shopping_list_repository.dart';
import 'package:dunija/features/shopping_book/domain/usecases/create_shopping_list.dart';
import 'package:dunija/features/shopping_book/domain/usecases/edit_shopping_list.dart';
import 'package:dunija/features/shopping_book/domain/usecases/get_shopping_list.dart';
import 'package:dunija/features/shopping_book/domain/usecases/remove_shopping_list.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'features/shopping_book/app/bloc/shopping_book_bloc.dart';
import 'features/shopping_book/domain/usecases/get_all_shopping_list.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// PRESENTATION LAYER
  ///? Bloc
  sl.registerFactory(
    () => ShoppingBookBloc(
      createShoppingList: sl(),
      editShoppingList: sl(),
      getShoppingList: sl(),
      getAllShoppingList: sl(),
      removeShoppingList: sl(),
    ),
  );

  /// DOMAIN LAYER
  ///? Usecases
  sl.registerLazySingleton(() => CreateShoppingList(sl()));
  sl.registerLazySingleton(() => EditShoppingList(sl()));
  sl.registerLazySingleton(() => GetShoppingList(sl()));
  sl.registerLazySingleton(() => GetAllShoppingList(sl()));
  sl.registerLazySingleton(() => RemoveShoppingList(sl()));

  ///? Repositories
  sl.registerLazySingleton<ShoppingListRepository>(
      () => ShoppingListRepositoryImpl(sl()));

  /// DATA LAYER
  ///? Data Sources
  sl.registerLazySingleton<ShoppingListDataSource>(
      () => ShoppingListDataSourceImpl(sl()));

  ///! CORE
  final DatabaseHelper helper = DatabaseHelper.instance;
  sl.registerLazySingleton(() => helper.initDatabase());

  ///! EXTERNAL
  sl.registerLazySingleton(() => Hive);
}
