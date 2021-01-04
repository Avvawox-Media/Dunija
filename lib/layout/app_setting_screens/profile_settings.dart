import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/custom_icon_icons.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileSettingScreen extends StatefulWidget {
  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  //Theme Variable
  bool _isLightTheme = true;

  //Enable Persistent Storage
  bool _isStorageEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        // toolbarOpacity: 0.0,
        backgroundColor: AppColors.whiteColor,
        centerTitle: false,
        leading: IconButton(
            splashRadius: 20.0,
            iconSize: 35.0,
            color: AppColors.darkAccent,
            icon: Icon(
              Icons.arrow_left,
              color: AppColors.darkAccent,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Profile Settings',
          style: AppStyles.setTextStyle(
            color: 0xFF000000,
            size: 18.0,
          ),
        ),
      ),
      body: Container(
        color: AppColors.whiteColor,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20.0),
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 30.0,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Anonymous User'),
                ],
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // height: 50.0,
            ),
            ListTile(
              title: Text('Edit Profile'),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text('Notification Setting'),
              leading: Icon(Icons.notifications_on),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              child: Text(
                'Subscription Setting',
                style: AppStyles.setTextStyle(size: 12),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
