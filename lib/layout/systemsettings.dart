import 'package:flutter/material.dart';
import 'package:dunija/settings/Appsettings.dart';

class SystemSettings extends StatefulWidget {
  @override
  _SystemSettingsState createState() => _SystemSettingsState();
}

class _SystemSettingsState extends State<SystemSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        color: AppSettings.bgColor,
      ),
    );
  }
}
