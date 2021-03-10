import 'package:flutter/material.dart';

class ShoppingListItem extends StatefulWidget {
  final String title;
  final String subText;
  final Function onDelete;
  final Function onEdit;

  const ShoppingListItem({
    Key key,
    this.title,
    this.subText,
    this.onDelete,
    this.onEdit,
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
          leading: Icon(Icons.list),
          title: Text(widget.title),
          subtitle: Text(widget.subText),
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
                  ),
                ),
                onTap: () {
                  widget.onEdit();
                },
              ),
              SizedBox(
                width: 10.0,
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
          onTap: () {},
        ),
      ),
    );
  }
}
