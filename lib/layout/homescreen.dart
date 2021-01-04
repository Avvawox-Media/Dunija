import 'dart:io';

import 'package:dunija/layout/admin_area.dart';
import 'package:dunija/layout/auth/login_screen.dart';
import 'package:dunija/layout/cat_pages/bakedfoodsscreen.dart';
import 'package:dunija/layout/cat_pages/barbicuescreen.dart';
import 'package:dunija/layout/cat_pages/friedfoodsscreen.dart';
import 'package:dunija/layout/cat_pages/porridgesscreen.dart';
import 'package:dunija/layout/cat_pages/saladsscreen.dart';
import 'package:dunija/layout/cat_pages/soupsscreen.dart';
import 'package:dunija/layout/dialog/infodialog.dart';
import 'package:dunija/layout/systemsettings.dart';
import 'package:dunija/models/recipe_category.dart';
import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/custom_icon_icons.dart';
import 'package:dunija/utils/lists.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/strings.dart';
import 'package:dunija/utils/styles.dart';
import 'package:dunija/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  //Menu Collapse
  bool isCollapsed = true;

  //
  ScrollController _scrollController = ScrollController();

  //Animation Duration
  final duration = Duration(milliseconds: 300);

  //Scale Animation Controller
  AnimationController _scaleController, _spinController;
  Animation<double> _scaleTransition;

  //User Status
  bool _isUserLogged = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(duration: duration, vsync: this);
    _spinController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _scaleTransition =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController);
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
    _scaleController.dispose();
    // _spinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Numbers.deviceHeight = MediaQuery.of(context).size.height;
    Numbers.deviceWidth = MediaQuery.of(context).size.width;

    //
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: AppColors.darkAccent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          brightness: Brightness.dark,
          toolbarHeight: 0.0,
          toolbarOpacity: 0.0,
          backgroundColor: AppColors.darkAccent.withOpacity(0.0),
          elevation: 0,
        ),
        body: Stack(
          children: [
            //App Menu function callback
            createAppMenu(context: context),

            //Animate on Menu clicked
            AnimatedPositioned(
              duration: duration,
              top: 0,
              left: isCollapsed ? 0.0 : -0.6 * Numbers.deviceWidth,
              right: isCollapsed ? 0.0 : 0.6 * Numbers.deviceWidth,
              bottom: 0,
              child: ScaleTransition(
                scale: _scaleTransition,
                child: InkWell(
                  onTap: () {
                    if (!isCollapsed) {
                      print('Clicked');
                      toggleMenu();
                    }
                  },
                  child: ClipRRect(
                    borderRadius: isCollapsed
                        ? BorderRadius.zero
                        : BorderRadius.circular(30.0),
                    child: Material(
                      elevation: 8.0,
                      child: Stack(children: [
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
                        //MainContent
                        Positioned(
                          top: 40.0,
                          child: Container(
                            width: Numbers.deviceWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // SizedBox(
                                //   width: 10.0,
                                // ),
                                Image(
                                  image: AssetImage('assets/imgs/dunija.png'),
                                  width: 0.5 * Numbers.deviceWidth,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.darkAccent
                                            .withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                      ),
                                      child: IconButton(
                                        // backgroundColor: AppColors.darkAccent
                                        // .withOpacity(0.5),
                                        icon: Icon(
                                          Icons.search,
                                          size: 30.0,
                                          color: AppColors.whiteColor,
                                        ),
                                        onPressed: () {
                                          //Handle on tap
                                          if (isCollapsed == false) {
                                            _scaleController.reverse();

                                            setState(() {
                                              isCollapsed = true;
                                            });
                                          }

                                          showSearch(
                                            context: context,
                                            delegate: SearchField(),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                          color: AppColors.darkAccent
                                              .withOpacity(0.8)),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.restaurant_menu,
                                          size: 30,
                                          color: AppColors.whiteColor,
                                        ),
                                        onPressed: () {
                                          print(
                                              'Menu is collapsed: $isCollapsed');

                                          toggleMenu();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        // Bottom Tabs
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            width: Numbers.deviceWidth,
                            height: Numbers.deviceHeight * (3 / 4),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  Numbers.mediumBoxBorderRadius,
                                ),
                                topRight: Radius.circular(
                                  Numbers.mediumBoxBorderRadius,
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
  Widget _tabSection(BuildContext context) {
    return (DefaultTabController(
      length: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height * (2 / 3),
            child: TabBarView(children: [
              Container(
                child: Scrollbar(
                  thickness: 5.0,
                  controller: _scrollController,
                  //Future Build Gridview's children
                  child: FutureBuilder(
                    future: fetchCatList(),
                    builder: (context, snapshot) {
                      //If Snapshot has error
                      if (snapshot.hasError)
                        return Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Something\'s not right'),
                          ),
                        );
                      //If snapshot has data
                      if (snapshot.hasData) {
                        return GridView.count(
                            padding: Platform.isAndroid
                                ? EdgeInsets.all(10.0)
                                : EdgeInsets.only(
                                    bottom: 10.0, left: 10.0, right: 10.0),
                            controller: _scrollController,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            children: AppLists.foodCatList.map((e) {
                              return buildMainCategories(
                                  title: e.title, image: e.image);
                            }).toList());
                      } else {
                        return Container(
                          alignment: Alignment.center,
                          child: SpinKitRotatingCircle(
                            color: AppColors.accent,
                            size: 50.0,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),

              //////////////////////////////////
              /// Favorite Recipe Tab
              //////////////////////////////////
              Container(
                  alignment: Alignment.center,
                  child: AppLists.foodList.isEmpty
                      ? Text('Favorite list is empty')
                      : ListView(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          children: AppLists.foodList.map((e) {
                            return buildFavItem(
                              title: e.name,
                              description: e.description,
                            );
                          }).toList(),
                        )),

              /////////////////////////////////////
              /// Health and Wellness Tab
              /////////////////////////////////////
              Container(
                alignment: Alignment.center,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  children: AppLists.foodList.map((e) {
                    return buildFeedbackItem(
                        title: e.name, description: e.description);
                  }).toList(),
                ),
              ),

              //////////////////////////////////
              /// Notification Tab
              //////////////////////////////////
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

          ////////////////////////////////////
          /// Tab Bar
          ////////////////////////////////////
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
                Tab(icon: Icon(CustomIcon.food, size: 22)),
                Tab(icon: Icon(Icons.favorite, size: 20)),
                Tab(icon: Icon(CustomIcon.notes_medical, size: 20)),
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

  Future<List<FoodCategory>> fetchCatList() async {
    return AppLists.foodCatList;
  }

  //
  Widget buildMainCategories({@required title, @required image}) {
    return InkWell(
      child: Align(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
            color: AppColors.accent,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3.0,
                  spreadRadius: 1.0)
            ],
          ),
          width: 0.45 * Numbers.deviceWidth,
          height: 0.46 * Numbers.deviceWidth,
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Numbers.smallBoxBorderRadius),
                  color: AppColors.lightAccent,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.darkAccent.withOpacity(0.5),
                        blurRadius: 10.0,
                        spreadRadius: 1.0)
                  ],
                ),
                width: 0.45 * Numbers.deviceWidth,
                height: 0.36 * Numbers.deviceWidth,
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                alignment: Alignment.center,
              ),
              Center(
                child: Text(
                  title,
                  style: Numbers.deviceWidth > 500
                      ? AppStyles.catBigLabel
                      : AppStyles.catLabel,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 2.0,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        // Collapse Menu
        setState(() {
          isCollapsed = true;
          _scaleController.reverse();
        });

        Future.delayed(Duration(seconds: 2), () {
          //
          Navigator.popUntil(context, ModalRoute.withName('/'));

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
        });

        //Show dialog while navigating to next page
        InfoDialog.showLoadingDialog(context);

        //
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
              radius: 35.0,
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
  Widget buildFeedbackItem({@required title, @required description}) {
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
              radius: 35.0,
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
    return InfoDialog.showExitDialog(
      context: context,
      title: 'Leaving?',
      msg: 'Your progress will be lost',
    );
  }

  onClickedNotification() {}

  void toggleMenu() {
    if (isCollapsed) {
      _scaleController.forward();
    } else {
      _scaleController.reverse();
    }
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  ///App Menu
  Widget createAppMenu({@required context, username, subtext}) {
    final menuTitleStyle = TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16.0,
        fontWeight: FontWeight.bold);
    final menuItemStyle = TextStyle(
        color: AppColors.whiteColor.withOpacity(0.8),
        fontSize: 15.0,
        fontWeight: FontWeight.bold);
    final subTextStyle =
        TextStyle(color: AppColors.whiteColor.withOpacity(0.7), fontSize: 12.0);

    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1.2 / 3,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
              color: AppColors.darkAccent,
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    toggleMenu();
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0x66000000),
                    child: Icon(
                      Icons.clear_rounded,
                      size: 25,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.whiteColor.withOpacity(0.5),
                  radius: 40.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  username == null ? AppStrings.username : username,
                  textAlign: TextAlign.right,
                  style: menuTitleStyle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  subtext == null ? AppStrings.userSubText : subtext,
                  textAlign: TextAlign.right,
                  style: subTextStyle,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Visibility(
                  visible: !_isUserLogged,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              settings: RouteSettings(name: '/Login'),
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                  width: 1.0,
                                  color:
                                      AppColors.whiteColor.withOpacity(0.5))),
                          child: Text(
                            'Login or Register',
                            style: AppStyles.whiteLabel,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10.0,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     // toggleMenu();
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) {
                      //             return SignUpScreen();
                      //           },
                      //           settings: RouteSettings(name: '/Register')),
                      //     );
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 10.0, vertical: 5.0),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(20.0),
                      //         border: Border.all(
                      //             width: 1.0,
                      //             color:
                      //                 AppColors.whiteColor.withOpacity(0.5))),
                      //     child: Text(
                      //       'Register',
                      //       style: AppStyles.whiteLabel,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              children: [
                SizedBox(
                  height: 5.0,
                ),
                // InkWell(
                //   onTap: () {
                //     //
                //   },
                //   child: ListTile(
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                //     title: Text(
                //       'Nutrition & Diet',
                //       textAlign: TextAlign.right,
                //       style: menuItemStyle,
                //     ),
                //     trailing: Icon(
                //       Icons.accessibility,
                //       color: AppColors.whiteColor,
                //     ),
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    //
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    title: Text(
                      'Meal Planner',
                      textAlign: TextAlign.right,
                      style: menuItemStyle,
                    ),
                    trailing: Icon(
                      Icons.next_plan_outlined,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    title: Text(
                      'Puchase Premium',
                      textAlign: TextAlign.right,
                      style: menuItemStyle,
                    ),
                    trailing: Icon(
                      Icons.wallet_travel,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                    // toggleMenu();
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    title: Text(
                      'Shopping List',
                      textAlign: TextAlign.right,
                      style: menuItemStyle,
                    ),
                    trailing: Icon(
                      Icons.list,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                    // toggleMenu();
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    title: Text(
                      'Share App',
                      textAlign: TextAlign.right,
                      style: menuItemStyle,
                    ),
                    trailing: Icon(
                      Icons.share,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                    // toggleMenu();
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    title: Text(
                      'Feedback',
                      textAlign: TextAlign.right,
                      style: menuItemStyle,
                    ),
                    trailing: Icon(
                      Icons.feedback,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                    // toggleMenu();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SystemSettings();
                    }));
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    title: Text(
                      'Settings',
                      textAlign: TextAlign.right,
                      style: menuItemStyle,
                    ),
                    trailing: Icon(
                      Icons.settings,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                    // toggleMenu();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return AdminArea();
                            },
                            settings: RouteSettings(name: '/AdminArea')));
                  },
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    title: Text(
                      'Admin Area',
                      textAlign: TextAlign.right,
                      style: menuItemStyle,
                    ),
                    trailing: Icon(
                      Icons.dashboard,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    //
                  },
                  child: Visibility(
                    visible: _isUserLogged,
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                      title: Text(
                        'Logout',
                        textAlign: TextAlign.right,
                        style: menuItemStyle,
                      ),
                      trailing: Icon(
                        Icons.logout,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
