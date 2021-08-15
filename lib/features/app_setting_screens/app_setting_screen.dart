import 'package:dunija/layout/app_setting_screens/profile_settings.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/custom_icon_icons.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SystemSettings extends StatefulWidget {
  @override
  _SystemSettingsState createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  //Theme Variable
  bool _isLightTheme = true;

  //Enable Persistent Storage
  bool _isStorageEnabled = false;

  //Health Tips
  bool _getHealthTips = false;

  //Stage Alarms State
  bool _isAlarmOn = false;

  //Stage Voice to Text State
  bool _isVoiceOn = false;

  //UserProfile Details
  String fullName, email, occupation, interests, badge, referrer, plan;

  @override
  void initState() {
    super.initState();
  }

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
              leading: Icon(
                Icons.person,
                color: AppColors.accent.withBlue(200),
              ),
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

            /////////////////////////////////
            ///Notification Tips
            /////////////////////////////////
            ListTile(
              title: Text('Notifications'),
              leading: Icon(Icons.notifications_on,
                  color: AppColors.accent.withBlue(80)),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              child: Text(
                'Subscriptions',
                style: AppStyles.setTextStyle(size: 12),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // height: 50.0,
            ),

            /////////////////////////////////
            ///Premium Plan
            /////////////////////////////////
            ListTile(
              title: Text('Premium Plan'),
              subtitle: Text(
                'Currently on - plan',
                softWrap: false,
                overflow: TextOverflow.fade,
                style: AppStyles.setTextStyle(color: 0xFF999999, size: 12.0),
              ),
              leading:
                  Icon(Icons.category, color: AppColors.accent.withGreen(180)),
            ),

            /////////////////////////////////
            ///Health Tips
            /////////////////////////////////
            ListTile(
                title: Text('Get Health Tips'),
                leading: Icon(CustomIcon.heartbeat,
                    size: 22.0,
                    color: AppColors.accent.withBlue(250).withRed(100)),
                subtitle: Text(
                  'Subscribe to vital health tips',
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: AppStyles.setTextStyle(color: 0xFF999999, size: 12.0),
                ),
                onTap: () {
                  setState(() {
                    _getHealthTips = !_getHealthTips;
                  });
                },
                trailing: Switch(
                  activeColor: AppColors.accent.withBlue(250).withRed(100),
                  value: _getHealthTips,
                  onChanged: (value) {
                    setState(() {
                      _getHealthTips = !_getHealthTips;
                    });
                  },
                )),

            //Kitchen
            Container(
              color: Colors.grey.withOpacity(0.1),
              child: Text(
                'Kitchen',
                style: AppStyles.setTextStyle(size: 12),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              // height: 50.0,
            ),

            /////////////////////////////////
            ///Kitchen Alarm setting
            /////////////////////////////////
            ListTile(
              title: Text('Alarm'),
              leading: Icon(CustomIcon.bullhorn,
                  color: AppColors.accent.withBlue(150)),
              subtitle: Text(
                'End of stage notification',
                softWrap: false,
                overflow: TextOverflow.fade,
                style: AppStyles.setTextStyle(color: 0xFF999999, size: 12.0),
              ),
              onTap: () {
                setState(() {
                  _isAlarmOn = !_isAlarmOn;
                });
              },
              trailing: Switch(
                value: _isAlarmOn,
                activeColor: AppColors.accent.withBlue(150),
                onChanged: (value) {
                  setState(() {
                    _isAlarmOn = !_isAlarmOn;
                  });
                },
              ),
            ),

            /////////////////////////////////
            ///Text to speech Notification
            /////////////////////////////////
            ListTile(
              title: Text('Hand-free mode'),
              leading: Icon(
                CustomIcon.assistive_listening_systems,
                color: AppColors.accent.withRed(150),
              ),
              subtitle: Text(
                'Voice instructions while cooking',
                softWrap: false,
                overflow: TextOverflow.fade,
                style: AppStyles.setTextStyle(color: 0xFF999999, size: 12.0),
              ),
              onTap: () {
                setState(() {
                  _isVoiceOn = !_isVoiceOn;
                });
              },
              trailing: Switch(
                value: _isVoiceOn,
                activeColor: AppColors.accent.withRed(150),
                onChanged: (value) {
                  setState(() {
                    _isVoiceOn = !_isVoiceOn;
                  });
                },
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

            /////////////////////////////////
            ///Persistent Storage Settings
            /////////////////////////////////
            ListTile(
              title: Text('Persistent Storage'),
              leading: Icon(
                Icons.storage,
                color: AppColors.accent.withGreen(50),
              ),
              onTap: () {
                setState(() {
                  _isStorageEnabled = !_isStorageEnabled;
                });
              },
              trailing: Switch(
                activeColor: AppColors.accent.withGreen(50),
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
