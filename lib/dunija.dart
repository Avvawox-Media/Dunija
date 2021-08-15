import 'dart:math';

import 'package:dunija/core/services/shared_pref.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/settings.dart';
import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/features/welcome_page.dart/welcome_page.dart';
import 'package:flutter/material.dart';

class Dunija extends StatefulWidget {
  //Session Token
  final token;

  Dunija({this.token});

  @override
  _DunijaState createState() => _DunijaState();
}

class _DunijaState extends State<Dunija> {
  @override
  void initState() {
    super.initState();

    // SharedPrefs().remove('app_key');
    initAppPrefs();

    //Set Init AppSetting
    AppSettings();
  }

  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryOrange,
        primaryColorLight: AppColors.primaryLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //Home Screen
      home: WelcomePage(),
    );
  }

  void initAppPrefs() {
    SharedPrefs().checkKey('app_key').then((value) {
      if (!value) {
        createDefaultUser();

        return;
      } else {
        print('User Already Exists');
      }
    });
  }

  Future<dynamic> createDefaultUser() async {
    String appKey = '';

    String _r1 = Random().nextInt(10000).toRadixString(16),
        _r2 = Random().nextInt(10000).toRadixString(16),
        _r3 = Random().nextInt(10000).toRadixString(16),
        _r4 = Random().nextInt(10000).toRadixString(16);

    appKey = '$_r1-$_r2-$_r3$_r4';

    //Print(appKey);
    print('Creating User: $appKey');

    //Set Other Default Preferences
    await setDefaultPrefs();

    return await SharedPrefs().save('app_key', appKey);
  }

  void setDefaultPrefs() async {
    //Profile Settings
    String fullName = '';
    String email = '';
    String interests = '';
    String occupation = '';
    String referrer = '';
    String badge = '';

    //Notifications

    //Premium Plans
    String plan = 'free';

    //Kitchen Settings
    bool enableAlarm = true;
    bool enableSpeech = true;

    //Subscription
    bool isHealthTips = true;

    //General
    bool storage = true;

    ///Iterate keys map and save prefs
    AppStrings.keys.forEach((key) async {
      switch (key) {
        case 'health':
          await SharedPrefs().save(key, isHealthTips);
          break;
        case 'alarm':
          await SharedPrefs().save(key, enableAlarm);
          break;
        case 'voice':
          await SharedPrefs().save(key, enableSpeech);
          break;
        case 'storage':
          await SharedPrefs().save(key, storage);
          break;
        case 'full_name':
          await SharedPrefs().save(key, fullName);
          break;
        case 'email':
          await SharedPrefs().save(key, email);
          break;
        case 'occupation':
          await SharedPrefs().save(key, occupation);
          break;
        case 'interests':
          await SharedPrefs().save(key, interests);
          break;
        case 'referrer':
          await SharedPrefs().save(key, referrer);
          break;
        case 'badge':
          await SharedPrefs().save(key, badge);
          break;
        case 'plan':
          await SharedPrefs().save(key, plan);
          break;
      }
    });
  }
}

//Initializes Hive database
// void initDatabase() async {
//   final documentDirectory =
//       await path_provider.getApplicationDocumentsDirectory();

//   Hive.init(documentDirectory.path);

//   final shoppingBook = await Hive.openBox('shopping_book');
//   // shoppingBook.put(key, value);
// }
