import 'package:dunija/layout/bakedfoodsscreen.dart';
import 'package:dunija/layout/barbicuescreen.dart';
import 'package:dunija/layout/user_screen.dart';
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Numbers.deviceHeight = MediaQuery.of(context).size.height;
    Numbers.deviceWidth = MediaQuery.of(context).size.width;

    //
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                    CustomIcon.user_alt,
                    size: 20,
                    color: AppColors.whiteColor,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return FavoriteScreen();
                    }));
                  },
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
      ),
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
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  children: AppLists.foodList.map((e) {
                    return buildDownloadItem(
                        title: e.name, description: e.description);
                  }).toList(),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: AppLists.foodList.isEmpty
                      ? Text('Favorite list is empty')
                      : ListView(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          children: AppLists.foodList.map((e) {
                            return buildFavItem(
                                title: e.name, description: e.description);
                          }).toList(),
                        )),
              Container(
                alignment: Alignment.center,
                child: AppLists.notificationList.isNotEmpty
                    ? ListView(
                        children: AppLists.notificationList.map((e) {
                          return buildNotificationWidget(
                              title: e.title,
                              description: e.description,
                              status: e.status);
                        }).toList(),
                      )
                    : Text("Notifications"),
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
                Tab(icon: Icon(Icons.favorite, size: 20)),
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

  //
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

  //
  Widget buildFavItem({@required title, @required description}) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        constraints: BoxConstraints(minHeight: 150.0, maxWidth: 300.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 10,
              offset: Offset(0, 1),
              spreadRadius: 1.0,
            )
          ],
          color: AppColors.whiteColor,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.accent,
              radius: 40.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.titleStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * (0.5)),
                  child: Text(
                    description = description.toString().length > 80
                        ? description.toString().substring(0, 80) + '...'
                        : description,
                    textAlign: TextAlign.justify,
                    style: AppStyles.favItemDesc,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  width: MediaQuery.of(context).size.width * (0.5),
                  child: InkWell(
                    child: CircleAvatar(
                      backgroundColor: AppColors.accent,
                      child: Icon(
                        Icons.delete,
                        color: AppColors.brightColor,
                        size: 15,
                      ),
                      radius: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //
  Widget buildDownloadItem({@required title, @required description}) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        constraints: BoxConstraints(minHeight: 120.0, maxWidth: 300.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: Offset(0, 1),
              spreadRadius: 1.0,
            )
          ],
          color: AppColors.whiteColor,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.accent,
              radius: 40.0,
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.titleStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * (0.5)),
                  child: Text(
                    description = description.toString().length > 40
                        ? description.toString().substring(0, 40) + '...'
                        : description,
                    textAlign: TextAlign.justify,
                    style: AppStyles.favItemDesc,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  width: MediaQuery.of(context).size.width * (0.55),
                  child: InkWell(
                    child: CircleAvatar(
                      backgroundColor: AppColors.accent,
                      child: Icon(
                        Icons.delete,
                        color: AppColors.brightColor,
                        size: 15,
                      ),
                      radius: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  //
  Widget buildNotificationWidget(
      {@required title, @required description, status}) {
    return InkWell(
      child: Card(
        elevation: 3.0,
        color: status.toString().toLowerCase() == 'seen'
            ? AppColors.whiteColor
            : AppColors.brightColor,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          constraints: BoxConstraints(minHeight: 80.0),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.titleStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                description,
                style: AppStyles.greyLabel,
              )
            ],
          )),
        ),
      ),
      onTap: () {},
    );
  }

  Future<bool> _onBackPressed() {
    //
  }

  onClickedNotification() {}
}
