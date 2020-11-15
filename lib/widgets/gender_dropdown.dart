import 'package:dunija/settings/lists.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:flutter/material.dart';

class GenterDropdown extends StatefulWidget {
  @override
  _GenterDropdownState createState() => _GenterDropdownState();
}

class _GenterDropdownState extends State<GenterDropdown> {
  var selectedItem = AppLists.genderList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Numbers.buttonHeight,
      width: 320.0,
      //padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1.0, color: Colors.grey.shade400),
      ),
      child: DropdownButton(
        itemHeight: 60.0,
        underline: Container(
          color: Colors.grey.shade200,
        ),
        value: selectedItem,
        items: AppLists.genderList.map((e) {
          return DropdownMenuItem(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 1.0,
                  color: Colors.grey.shade200,
                )
              ],
            ),
            value: e,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value;
          });
        },
      ),
    );
  }
}
