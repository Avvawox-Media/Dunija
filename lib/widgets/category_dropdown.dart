import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/lists.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  var selectedItem = AppLists.categoryNames.first;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    focusNode.addListener(() {
      print("Dropdown has focus: ${focusNode.hasFocus}");
    });
    return Container(
      alignment: Alignment.center,
      height: 40.0,
      width: Numbers.centerBoxWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Numbers.largeBoxBorderRadius),
        border: Border.all(
            width: 1.0, color: AppColors.darkAccent.withOpacity(0.5)),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 12.0,
            ),
            Icon(
              Icons.category,
              color: Color(0xAA333333),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: DropdownButton(
                isExpanded: true,
                itemHeight: 50.0,
                focusNode: focusNode,
                hint: Text('Select Category'),
                focusColor: AppColors.darkAccent,
                underline: Container(
                  color: Colors.grey.shade200,
                  height: 0.0,
                ),
                value: selectedItem,
                items: AppLists.categoryNames.map((e) {
                  return DropdownMenuItem(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            e,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: AppColors.blackColor.withOpacity(0.6)),
                          ),
                        ),
                        Container(
                          height: 0.0,
                          //  width: 200,
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
            ),
          ]),
    );
  }
}
