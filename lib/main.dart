import 'package:dunija/screens/welcome.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppSettings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppSettings.primaryColor,
        primaryColorDark: AppSettings.primaryOrange,
        primaryColorLight: AppSettings.primaryLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      //Home Screen
      home: WelcomeScreen(),
    );
  }
}
