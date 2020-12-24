import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final String name, interest;
  final image;
  UserListItem(
      {@required this.name, @required this.interest, @required this.image});

  @override
  Widget build(BuildContext context) {
    ////////////////////////////////////////
    /// User list item MODEL
    ////////////////////////////////////////

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
              spreadRadius: 0.5,
              blurRadius: 3.0,
              color: AppColors.darkAccent.withOpacity(0.2),
              offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          print(name.toString());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: AppColors.brightColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
          ),
          //Child
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.0,
                child: image,
                backgroundColor: AppColors.lightAccent.withOpacity(0.0),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: AppStyles.setTextStyle(
                        weight: FontWeight.bold, size: 16.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(interest.toString()),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                    color: AppColors.accent.withOpacity(0.9),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
