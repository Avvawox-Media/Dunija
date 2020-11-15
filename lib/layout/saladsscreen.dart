import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/custom_icon_icons.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/strings.dart';
import 'package:dunija/settings/styles.dart';
import 'package:flutter/material.dart';

class SaladsScreen extends StatefulWidget {
  @override
  _SaladsScreenState createState() => _SaladsScreenState();
}

class _SaladsScreenState extends State<SaladsScreen> {
  @override
  Widget build(BuildContext context) {
    Numbers.deviceHeight = MediaQuery.of(context).size.height;
    Numbers.deviceWidth = MediaQuery.of(context).size.width;

    //Page Name
    final pageName = AppStrings.salads;

    //
    return Scaffold(
      body: Stack(children: [
        Container(
          color: AppColors.accent,
          width: Numbers.deviceWidth,
          height: Numbers.deviceHeight,
        ),
        Positioned(
          top: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/top_food.png'),
            fit: BoxFit.contain,
            width: Numbers.deviceWidth,
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Positioned(
          top: 0.0,
          right: -50.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Positioned(
          top: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.0,
              ),
              Column(children: [
                SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
              SizedBox(
                width: 5.0,
              ),
              Image(
                image: AssetImage('assets/imgs/dunija.png'),
                width: 120.0,
              ),
              //SvgPicture.asset('assets/imgs/home.svg'),
              SizedBox(
                width: Numbers.deviceWidth - 280,
              ),
              InkWell(
                child: Icon(
                  Icons.search,
                  color: AppColors.whiteColor,
                ),
                onTap: () {
                  //Handle on tap
                },
              ),
              SizedBox(
                width: 40.0,
              ),
              InkWell(
                child: Icon(
                  CustomIcon.user_alt,
                  size: 20,
                  color: AppColors.whiteColor,
                ),
                onTap: () {},
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
        Positioned(
          top: 130.0,
          child: Padding(
            child: Container(child: Text(pageName, style: AppStyles.pageTitle)),
            padding: EdgeInsets.only(left: 20.0),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: Numbers.deviceWidth,
            height: Numbers.deviceHeight * (3 / 4),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  Numbers.smallBoxBorderRadius,
                ),
                topRight: Radius.circular(
                  Numbers.largeBoxBorderRadius,
                ),
              ),
              boxShadow: [
                BoxShadow(
                    color: Color(0x33000000),
                    spreadRadius: 1.0,
                    blurRadius: 15.0)
              ],
            ),
            child: Container(),
          ),
        ),
      ]),
    );
  }
}
