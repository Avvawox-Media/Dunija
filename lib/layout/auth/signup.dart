import 'package:dunija/layout/bakedfoodsscreen.dart';
import 'package:dunija/layout/barbicuescreen.dart';
import 'package:dunija/layout/friedfoodsscreen.dart';
import 'package:dunija/layout/porridgesscreen.dart';
import 'package:dunija/layout/saladsscreen.dart';
import 'package:dunija/layout/soupsscreen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/custom_icon_icons.dart';
import 'package:dunija/settings/lists.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Numbers.deviceHeight = MediaQuery.of(context).size.height;
    Numbers.deviceWidth = MediaQuery.of(context).size.width;

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
              Image(
                image: AssetImage('assets/imgs/dunija.png'),
                width: 120.0,
              ),
              //SvgPicture.asset('assets/imgs/home.svg'),
              SizedBox(
                width: Numbers.deviceWidth - 250,
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
                  Icons.favorite,
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
            child: _tabSection(context),
          ),
        ),
      ]),
    );
  }

  Widget _tabSection(BuildContext context) {
    return (DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            //Add this to give height
            height: MediaQuery.of(context).size.height * (2 / 3),
            child: TabBarView(children: [
              Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  children: AppLists.foodCatList.map((e) {
                    return buildMainCateries(title: e.title, image: e.image);
                  }).toList(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("Downloaded Recipe"),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("User Account Info"),
              ),
              Container(
                alignment: Alignment.center,
                child: Text("Notifications"),
              ),
            ]),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 2.0,
                    spreadRadius: 0.5)
              ],
            ),
            child: TabBar(
              indicator: MaterialIndicator(
                tabPosition: TabPosition.top,
                topLeftRadius: 0,
                topRightRadius: 0,
                height: 1,
                color: AppColors.accent,
              ),
              tabs: [
                Tab(icon: Icon(CustomIcon.food, size: 24)),
                Tab(icon: Icon(CustomIcon.download, size: 21)),
                Tab(icon: Icon(CustomIcon.user_alt, size: 20)),
                Tab(icon: Icon(CustomIcon.notifications_none, size: 25)),
              ],
              labelColor: AppColors.accent,
              unselectedLabelColor: Colors.grey,
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildMainCateries({@required title, @required image}) {
    return InkWell(
      child: Align(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
            color: AppColors.brightColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3.0,
                  spreadRadius: 1.0)
            ],
          ),
          constraints: BoxConstraints(
            maxWidth: 150.0,
            minWidth: 100.0,
            minHeight: 200.0,
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              //
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Numbers.smallBoxBorderRadius),
                  color: AppColors.lightAccent,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.darkAccentTrans,
                        blurRadius: 10.0,
                        spreadRadius: 1.0)
                  ],
                ),
                constraints: BoxConstraints(
                  maxWidth: 150.0,
                  maxHeight: 130.0,
                  minWidth: 100.0,
                  minHeight: 100.0,
                ),
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                  width: 100.0,
                ),
                alignment: Alignment.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                child: Text(
                  title,
                  style: AppStyles.catLabel,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        //Switch Category title
        switch (title) {
          case 'Baked Foods':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return BakedFoodScreen();
                    },
                    settings: RouteSettings(name: '/Baked')));
            break;

          case 'Barbicues':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return BarbicueScreen();
                    },
                    settings: RouteSettings(name: '/Barbicues')));
            break;

          case 'Fried Foods':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return FriedFoodsScreen();
                    },
                    settings: RouteSettings(name: '/Frieds')));
            break;

          case 'Porridges':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return PorridgesScreen();
                    },
                    settings: RouteSettings(name: '/Porridges')));
            break;

          case 'Salads':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return SaladsScreen();
                    },
                    settings: RouteSettings(name: '/Salads')));
            break;

          case 'Soups':
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return SoupsScreen();
                    },
                    settings: RouteSettings(name: '/Soups')));
            break;
        }
      },
    );
  }
}
