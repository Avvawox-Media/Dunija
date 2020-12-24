import 'package:dunija/layout/dialog/infodialog.dart';
import 'package:dunija/layout/kitchen_screen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  final String title, category;
  final image;
  RecipeListItem(
      {@required this.title, @required this.category, @required this.image});

  @override
  Widget build(BuildContext context) {
    ////////////////////////////////////////
    /// Recipe list item MODEL
    ////////////////////////////////////////

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
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
          print(title.toString());
          Future.delayed(Duration(seconds: 2), () {
            //Dismiss Loading dialog
            Navigator.pop(context);

            //Navigate to Kitchen Screen
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return KitchenScreen(recipe: title.toString());
            }));
          });

          InfoDialog.showLoadingDialog(context, msg: 'Preparing your kitchen');
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
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    style: AppStyles.setTextStyle(
                        weight: FontWeight.bold, size: 16.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(category.toString()),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () {},
                    color: AppColors.accent.withOpacity(0.9),
                  ),

                  ///Mark to be added as RECIPE REMINDER button in Future Version
                  IconButton(
                    icon: Icon(Icons.alarm),
                    onPressed: () {},
                    color: AppColors.darkAccent.withOpacity(0.8),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
