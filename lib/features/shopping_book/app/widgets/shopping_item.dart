import 'package:dunija/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ShoppingItem extends StatefulWidget {
  final String name;
  final String description;

  const ShoppingItem({Key key, this.name, this.description}) : super(key: key);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwitchListTile(
        activeColor: AppColors.darkAccent,
        value: isSelected,
        secondary: Icon(Icons.shopping_bag),
        title: Text.rich(
          TextSpan(
            text: widget.name,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkAccent,
                decoration: !isSelected
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ),
        subtitle: Text(
          widget.description,
          style: TextStyle(fontSize: 11.0),
        ),
        onChanged: (value) {
          setState(() {
            isSelected = value;
          });
        },
      ),
    );
  }
}
