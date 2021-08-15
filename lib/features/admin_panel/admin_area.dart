import 'package:dunija/features/admin_panel/add_recipe_view.dart';
import 'package:dunija/features/admin_panel/recipe_list_view.dart';
import 'package:dunija/features/admin_panel/user_list_view.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/custom_icon_icons.dart';
import 'package:dunija/core/utils/lists.dart';
import 'package:dunija/core/utils/quantities.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

// final style = TextStyle(color: AppSettings.bgColor);

class _AdminPageState extends State<AdminPage> with TickerProviderStateMixin {
  var pageName = 'Admin';

  TabController _tabController;
  int stages = 1;

  List<Widget> widgetList;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //render Search Bar

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
            image: AssetImage('assets/imgs/dunija_bg.png'),
            fit: BoxFit.fitHeight,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ]),
                      SizedBox(
                        width: 0.0,
                      ),
                      Image(
                        image: AssetImage('assets/imgs/dunija.png'),
                        width: 120.0,
                      ),
                      SizedBox(
                        width: Numbers.deviceWidth - 230,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: TabBar(
                indicatorColor: AppColors.darkAccent.withOpacity(0.5),
                indicator: BoxDecoration(
                    color: AppColors.darkAccent.withOpacity(0.3),
                    borderRadius:
                        BorderRadius.circular(Numbers.largeBoxBorderRadius)),
                controller: _tabController,
                tabs: [
                  Tab(
                    icon: Icon(CustomIcon.food),
                  ),
                  Tab(
                    icon: Icon(Icons.add_box),
                  ),
                  Tab(
                    icon: Icon(Icons.mail),
                  ),
                  // Tab(
                  //   icon: Icon(Icons.add_box),
                  // ),
                  Tab(
                    icon: Icon(Icons.group),
                  ),
                ],
              ),
            ),

            //Bottom Section
            Expanded(
              child: Container(
                width: Numbers.deviceWidth,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x33000000),
                        spreadRadius: 1.0,
                        blurRadius: 15.0)
                  ],
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //First Tab's View (Manage Recipes)
                    AdminRecipeListView(AppLists.fetchAllRecipeList()),

                    //Second Tab's View (Create New Recipe)
                    AddRecipeListView(),

                    //Third Tab's View (Direct Messages from users within Dunija)
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Messages from users',
                        style: AppStyles.setTextStyle(),
                      ),
                    ),

                    //Fourth Tab's View (Manage Users)
                    UserListView(AppLists.fetchUsersList()),
                  ],
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: SizedBox(
                height: 0,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
