import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileSettingScreen extends StatefulWidget {
  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
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
            icon: Icon(
              Icons.arrow_left,
              color: AppColors.blackColor,
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
            // SizedBox(height: 5.0),
            Container(
              // color: AppColors.accent,
              padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              child: Container(
                height: 160.0,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: AppColors.darkAccent,
                      ),
                      radius: 30.0,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text('Anonymous User'),
                  ],
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                // height: 50.0,
              ),
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
