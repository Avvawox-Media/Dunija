import 'package:dunija/layout/app_setting_screens/profile_settings.dart';
import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/custom_icon_icons.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';

class SystemSettings extends StatefulWidget {
  @override
  _SystemSettingsState createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
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
          'Dunija Settings',
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
              child: Text(
                'Account',
                style: AppStyles.setTextStyle(size: 12),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // height: 50.0,
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileSettingScreen();
                    },
                    settings: RouteSettings(arguments: '/Profile'),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Notifications'),
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
            ListTile(
              title: Text('Plan'),
              leading: Icon(Icons.category),
            ),
            ListTile(
              title: Text('Notification Setting'),
              leading: Icon(Icons.notifications_on),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              child: Text(
                'Environment',
                style: AppStyles.setTextStyle(size: 12),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // height: 50.0,
            ),
            ListTile(
              title: Text('Kitchen'),
              leading: Icon(CustomIcon.food),
              subtitle: Text(
                'Appearance, Text-to-speech',
                style: AppStyles.setTextStyle(color: 0xFF999999, size: 12.0),
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              child: Text(
                'General',
                style: AppStyles.setTextStyle(size: 12),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // height: 50.0,
            ),
            ListTile(
              title: Text('Light Theme'),
              leading: Icon(Icons.palette),
              onTap: () {
                setState(() {
                  _isLightTheme = !_isLightTheme;
                });
              },
              trailing: Switch(
                activeColor: AppColors.accent,
                value: _isLightTheme,
                onChanged: (value) {
                  setState(() {
                    _isLightTheme = !_isLightTheme;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Enable Persistent Storage'),
              leading: Icon(Icons.storage),
              onTap: () {
                setState(() {
                  _isStorageEnabled = !_isStorageEnabled;
                });
              },
              trailing: Switch(
                activeColor: AppColors.accent,
                value: _isStorageEnabled,
                onChanged: (value) {
                  setState(() {
                    _isStorageEnabled = !_isStorageEnabled;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
