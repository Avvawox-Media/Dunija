import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dunija/screens/bakedfoodsscreen.dart';
import 'package:dunija/screens/barbicuescreen.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:dunija/screens/friedfoodsscreen.dart';
import 'package:dunija/screens/porridgesscreen.dart';
import 'package:dunija/screens/saladsscreen.dart';
import 'package:dunija/routes/slidepageroute.dart';
import 'package:dunija/screens/soupsscreen.dart';
import 'package:dunija/screens/systemsettings.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //
  final appTitle = AppSettings.appName;

  BuildContext context;

  static List<String> mainCatList = [
    "Baked Foods",
    "Barbicue",
    "Fried Foods",
    "Porridges",
    "Salads",
    "Soups",
  ];

  @override
  Widget build(BuildContext context) {
    //Initialized global context
    this.context = context;

    //Drawer
    final drawer = Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            color: AppSettings.primaryOrange,
          ),
          Container(),
        ],
      ),
    );

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
        AppSettings.appName,
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
        child: appBar,
        preferredSize: Size.fromHeight(90.0),
      ),
      drawer: drawer,
      body: Stack(
        children: [
          Container(
            color: AppSettings.bgColor,
            alignment: Alignment.center,
            child: GridView.count(
              crossAxisCount: 2,
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: foodIcons(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> foodIcons() {
    var iconView;
    List<Widget> list = [];

    for (String name in mainCatList) {
      var imageName = name.toLowerCase().replaceAll(" ", "_") + ".png";
      // print(imageName);
      iconView = InkWell(
        onTap: () {
          switch (name) {
            case 'Baked Foods':
              Navigator.push(
                  context, SlidePageRoute(widget: BakedFoodsScreen()));
              break;
            case 'Barbicue':
              Navigator.push(context, SlidePageRoute(widget: BarbicueScreen()));
              break;
            case 'Fried Foods':
              Navigator.push(
                  context, SlidePageRoute(widget: FriedFoodsScreen()));
              break;
            case 'Porridges':
              Navigator.push(
                  context, SlidePageRoute(widget: PorridgesScreen()));
              break;
            case 'Salads':
              Navigator.push(context, SlidePageRoute(widget: SaladsScreen()));
              break;
            case 'Soups':
              Navigator.push(context, SlidePageRoute(widget: SoupsScreen()));
              break;
          }
        },
        child: Container(
          // color: AppSettings.btnDark,
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 15.0),
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/imgs/$imageName'),
                height: MediaQuery.of(context).size.width / 2 - 30.0,
              ),
            ],
          ),
        ),
      );
      list.add(iconView);
    }
    return list;
  }
}
