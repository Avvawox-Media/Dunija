import 'package:dunija/layout/homescreen.dart';
import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

void main() async {
  var token;

  WidgetsFlutterBinding.ensureInitialized();

  await FlutterSession()
      .get('token')
      .then((value) => token = value == null ? '' : value.toString());

  runApp(Dunija(token: token));
}

class Dunija extends StatelessWidget {
  //Session Token
  final token;

  Dunija({this.token});

  // This widget is the root of your application.
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
      home: HomeScreen(),
    );
  }
}
