import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/lists.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:flutter/material.dart';

class InterestsDropdown extends StatefulWidget {
  @override
  _InterestsDropdownState createState() => _InterestsDropdownState();
}

class _InterestsDropdownState extends State<InterestsDropdown> {
  var selectedItem = AppLists.interests.first;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() {
      print("Dropdown has focus: ${focusNode.hasFocus}");
    });
    return Container(
      alignment: Alignment.center,
      height: Numbers.buttonHeight,
      width: Numbers.centerBoxWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Numbers.largeBoxBorderRadius),
        border: Border.all(width: 1.0, color: AppColors.darkAccent),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 12.0,
            ),
            Icon(
              Icons.favorite,
              color: Color(0xAA333333),
            ),
            SizedBox(
              width: 10.0,
            ),
            DropdownButton(
              itemHeight: 50.0,
              focusNode: focusNode,
              hint: Text('Select Interest'),
              focusColor: AppColors.darkAccent,
              underline: Container(
                color: Colors.grey.shade200,
                height: 0.0,
              ),
              value: selectedItem,
              items: AppLists.interests.map((e) {
                return DropdownMenuItem(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(minWidth: 200.0),
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
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
          ]),
    );
  }
}
