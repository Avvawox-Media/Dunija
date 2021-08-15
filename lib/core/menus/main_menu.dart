import 'dart:io';

import 'package:dunija/features/admininstration/admin_area.dart';
import 'package:dunija/layout/app_setting_screens/app_setting_screen.dart';
import 'package:dunija/features/auth/app/pages/login_screen.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MainMenu extends StatefulWidget {
  final String username;
  final String subtext;
  final Function onClosed;

  const MainMenu({Key key, this.username, this.subtext, this.onClosed})
      : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  //User Status
  bool _isUserLogged = false;

  @override
  Widget build(BuildContext context) {
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
                    widget.onClosed();
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
                  widget.username == null
                      ? AppStrings.username
                      : widget.username,
                  textAlign: TextAlign.right,
                  style: menuTitleStyle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.subtext == null
                      ? AppStrings.userSubText
                      : widget.subtext,
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
                    if (Platform.isAndroid) {
                      Share.share(AppStrings.playstoreLink);
                      print('Shared Android');
                    } else {
                      Share.share(AppStrings.appstoreLink,
                          subject: 'Share App');
                      print('Shared, Apple');
                    }
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
                              return AdminPage();
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
