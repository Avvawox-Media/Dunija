import 'package:dunija/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ShoppingListItem extends StatefulWidget {
  final String title;
  final String subText;
  final Function onDelete;
  final Function onEdit;
  final Function onTap;

  const ShoppingListItem({
    Key key,
    this.title,
    this.subText,
    this.onDelete,
    this.onEdit,
    this.onTap,
  }) : super(key: key);

  @override
  _ShoppingListItemState createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(),
      child: Card(
        child: ListTile(
          leading: Container(
              alignment: Alignment.center,
              width: 30.0,
              child: Icon(Icons.list)),
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: AppColors.darkAccent),
          ),
          subtitle: Text(
            widget.subText,
            style: TextStyle(fontSize: 11.0),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Edit Button
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  padding: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.edit,
                    size: 18.0,
                    color: AppColors.darkAccent,
                  ),
                ),
                onTap: () {
                  widget.onEdit();
                },
              ),
              SizedBox(
                width: 5.0,
              ),

              //Delete Button
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  padding: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.delete,
                    size: 18.0,
                  ),
                ),
                onTap: () {
                  widget.onDelete();
                },
              )
            ],
          ),
          onTap: () {
            widget.onTap();
          },
        ),
      ),
    );
  }
}
