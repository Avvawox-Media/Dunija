import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/features/shopping_book/app/widgets/shopping_item.dart';
import 'package:dunija/features/shopping_book/domain/entities/shopping_list_entity.dart';
import 'package:flutter/material.dart';

class ExpandedShoppingListPage extends StatefulWidget {
  final ShoppingList shoppingList;

  const ExpandedShoppingListPage({Key key, this.shoppingList})
      : super(key: key);

  @override
  _ExpandedShoppingListPageState createState() =>
      _ExpandedShoppingListPageState();
}

class _ExpandedShoppingListPageState extends State<ExpandedShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          '${widget.shoppingList.listTitle} List',
          style: TextStyle(
            fontSize: 16.0,
            color: AppColors.darkAccent.withOpacity(0.5),
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.darkAccent),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.shoppingList.items.length,
          itemBuilder: (context, index) {
            List<dynamic> items = widget.shoppingList.items;

            return ShoppingItem(
              name: items.elementAt(index)['name'],
              description: items.elementAt(index)['description'],
            );
          },
        ),
      ),
    );
  }
}
