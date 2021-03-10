import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/features/shopping_book/app/widgets/shopping_list_item.dart';
import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LoadedStateView extends StatefulWidget {
  final List<ShoppingList> shoppingLists;

  const LoadedStateView({Key key, this.shoppingLists}) : super(key: key);

  @override
  _LoadedStateViewState createState() => _LoadedStateViewState();
}

class _LoadedStateViewState extends State<LoadedStateView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
