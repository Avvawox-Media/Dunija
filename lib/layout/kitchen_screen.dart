import 'dart:async';
import 'package:dunija/layout/dialog/infodialog.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/strings.dart';
import 'package:dunija/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:flutter/rendering.dart';

class KitchenScreen extends StatefulWidget {
  final recipe;

  //
  KitchenScreen({@required this.recipe});

  @override
  _KitchenScreenState createState() => _KitchenScreenState();
}

final style = TextStyle(color: AppSettings.bgColor);

class _KitchenScreenState extends State<KitchenScreen> {
  //

  var pageName = 'Kitchen';

  //Screen type
  bool isLongScreen = Numbers.deviceHeight > 960 ? true : false;

  Future<bool> _onBackPressed() {
    //
    Navigator.pop(context);
  }

  //Progress Bar rate
  var progressRate = 0.0;

  //Scroll Controller
  ScrollController _scrollController = ScrollController();

  bool isPlay = false;

  computeProgress() {
    var timer;
    timer = Timer.periodic(Duration(milliseconds: 200), (t) {
      //
      progressRate += 1;
      print(progressRate);
      if (progressRate >= 100) {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    //computeProgress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(Numbers.deviceHeight);
    //
    var progress = Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: (Numbers.deviceWidth - 150) * 0.7, //(progressRate / 100),
          height: 25.0,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.accent,
                  AppColors.whiteColor,
                ]),
            border: Border.all(color: AppColors.brightColor, width: 2.0),
            borderRadius: BorderRadius.circular(
              Numbers.largeBoxBorderRadius,
            ),
            image: DecorationImage(
              image: AssetImage('assets/imgs/progress.png'),
              fit: BoxFit.fitHeight,
              repeat: ImageRepeat.repeatX,
            ),
          ),
        ));

    //
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          toolbarHeight: 80.0,
          backgroundColor: AppColors.whiteColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage('assets/imgs/dunija.png'),
                        width: 100.0,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Numbers.largeBoxBorderRadius),
                        color: AppColors.accent),
                    width: Numbers.deviceWidth / 2 - 20,
                    height: 30.0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.0,
                        ),
                        Image(
                          image: AssetImage('assets/imgs/icon.png'),
                          width: 28.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.recipe,
                          style: AppStyles.whiteLabel,
                        )
                      ],
                    ),
                  ),
                  //Exit Kitchen Button
                  GestureDetector(
                    onTap: () {
                      InfoDialog.showExitKitchenDialog(
                          context: context,
                          title: AppStrings.exitKitchenTitle,
                          msg: AppStrings.exitKitchenMsg);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      child: Icon(
                        Icons.cancel_outlined,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              // key: Key('value'),
              child: Container(
                // top: 0,
                child: SafeArea(
                  child: Container(
                    width: Numbers.deviceWidth,
                    child: Column(
                      children: [
                        SizedBox(height: 5.0),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: Numbers.deviceWidth,
                          child: RichText(
                            text: TextSpan(
                              children: [TextSpan(text: '2')],
                              text: 'Step ',
                              style: AppStyles.titleStyle,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Numbers.mediumBoxBorderRadius),
                            color: AppColors.accent,
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppColors.accent,
                                  AppColors.lightAccent,
                                ]),
                          ),
                          width: Numbers.deviceWidth,
                          margin: EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              //Inner Image Container
                              Container(
                                width: Numbers.deviceWidth,
                                height: Numbers.deviceWidth > 500
                                    ? 0.45 * Numbers.deviceHeight
                                    : 0.30 * Numbers.deviceHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Numbers.mediumBoxBorderRadius),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.darkAccent,
                                        spreadRadius: 1,
                                        blurRadius: 25,
                                        offset: Offset(0, 15))
                                  ],
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        AppColors.brightColor,
                                        AppColors.whiteColor,
                                      ]),
                                ),
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  //Progress Bar
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height:
                                        Numbers.deviceWidth > 500 ? 20.0 : 15.0,
                                    width: Numbers.deviceWidth * 0.65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Numbers.largeBoxBorderRadius),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          AppColors.whiteColor,
                                          AppColors.brightColor
                                        ],
                                      ),
                                    ),
                                    child: progress,
                                    clipBehavior: Clip.hardEdge,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  //Count-down Time
                                  Container(
                                    alignment: Alignment.center,
                                    width: 0.15 * Numbers.deviceWidth,
                                    decoration: BoxDecoration(
                                      color: AppColors.accent,
                                      borderRadius: BorderRadius.circular(
                                        Numbers.smallBoxBorderRadius,
                                      ),
                                      border: Border.all(
                                          width: 0.5,
                                          color: AppColors.brightColorTrans2),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3.0),
                                    child: Text(
                                      '2:30',
                                      style: AppStyles.boldWhiteLabel,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Scrollbar(
                              controller: _scrollController,
                              child: ListView(
                                controller: _scrollController,
                                children: [
                                  Text(''),
                                  Text('data2'),
                                  Text('data3'),
                                  Text('data4'),
                                  Text(''),
                                  Text('data2'),
                                  Text('data3'),
                                  Text('data4'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Bottom bar
            Container(
                child: Container(
              width: Numbers.deviceWidth,
              height: 0.07 * Numbers.deviceHeight,
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment:
                    isLongScreen ? Alignment.center : Alignment.topCenter,
                children: [
                  Numbers.deviceWidth > 415.0
                      ? Container(
                          decoration:
                              BoxDecoration(color: AppColors.brightColor),
                          width: Numbers.deviceWidth,
                        )
                      : Image(
                          image: AssetImage('assets/imgs/player_bg.png'),
                          width: Numbers.deviceWidth,
                          fit: BoxFit.cover,
                        ),
                  GestureDetector(
                    onTap: () {
                      //Play or Pause Tapped
                      playPause();
                    },
                    onTapCancel: () {
                      //
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80.0,
                      height: 0.05 * Numbers.deviceHeight,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.lightAccent,
                            AppColors.accent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Icon(
                        isPlay ? Icons.pause : Icons.play_arrow_rounded,
                        color: AppColors.brightColor,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  playPause() {
    setState(() {
      isPlay = !isPlay;
    });
  }
}
