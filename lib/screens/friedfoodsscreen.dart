import 'package:flutter/material.dart';
import 'package:dunija/routes/slidepageroute.dart';
import 'package:dunija/screens/systemsettings.dart';

class FriedFoodsScreen extends StatefulWidget {
  @override
  _FriedFoodsScreenState createState() => _FriedFoodsScreenState();
}

class _FriedFoodsScreenState extends State<FriedFoodsScreen> {
  @override
  Widget build(BuildContext context) {
    //AppBar
    final appBar = AppBar(
      backgroundColor: Color(0x00ffffff),
      elevation: 0,
      flexibleSpace: Container(
        padding: EdgeInsets.all(0.0),
        child: Image(
          image: AssetImage('assets/imgs/abg_dark.png'),
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        "Fried Foods",
      ),
      centerTitle: false,
      actions: [
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert),
          onSelected: (choice) {
            switch (choice) {
              case 'Settings':
                Navigator.push(
                    context, SlidePageRoute(widget: SystemSettings()));
                break;
            }
          },
          itemBuilder: (context) {
            return {'Settings'}.map((e) {
              return PopupMenuItem<String>(
                child: Text(e),
                value: e,
              );
            }).toList();
          },
        )
      ],
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: appBar,
      ),
      body: Container(),
    );
  }
}
