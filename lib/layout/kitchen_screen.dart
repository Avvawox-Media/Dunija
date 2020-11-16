import 'dart:async';

import 'package:dunija/layout/auth/login_screen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:dunija/widgets/interest_dropdown.dart';
import 'package:dunija/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:flutter/rendering.dart';

class KitchenScreen extends StatefulWidget {
  @override
  _KitchenScreenState createState() => _KitchenScreenState();
}

final style = TextStyle(color: AppSettings.bgColor);

class _KitchenScreenState extends State<KitchenScreen> {
  //

  var pageName = 'Kitchen', foodTitle = 'Food Title';

  Future<bool> _onBackPressed() {
    //
  }

  var progressRate = 0.0;

  var progressBar = LinearProgressIndicator();

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
              Numbers.smallBoxBorderRadius,
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
          toolbarHeight: 80.0,
          backgroundColor: AppColors.whiteColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Container(
            child: Row(children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.accent,
                  ),
                ),
                onTap: () {
                  //
                },
              ),
              Image(
                image: AssetImage('assets/imgs/dunija.png'),
                width: 100.0,
              ),
              SizedBox(
                width: 20.0,
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
                      foodTitle,
                      style: AppStyles.whiteLabel,
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: Numbers.deviceWidth,
                child: Column(
                  children: [
                    SizedBox(height: 5.0),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      width: Numbers.deviceWidth <= 415.0
                          ? Numbers.deviceWidth
                          : 415.0,
                      child: Text(
                        'Step 1',
                        style: AppStyles.titleStyle,
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
                      width: Numbers.deviceWidth <= 415.0
                          ? Numbers.deviceWidth
                          : 415.0,
                      height: 300.0,
                      // ,
                      margin: EdgeInsets.all(5.0),
                      //Inner Image Container
                      child: Column(
                        children: [
                          Container(
                            width: Numbers.deviceWidth,
                            height: 200.0,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Progress Bar
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 15.0,
                                width: Numbers.deviceWidth - 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Numbers.smallBoxBorderRadius),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                          AppColors.whiteColor,
                                          AppColors.brightColor
                                        ])),
                                child: progress,
                                clipBehavior: Clip.hardEdge,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              //Count-down Time
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 50.0,
                                color: AppColors.accent,
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(
                                  '2:30',
                                  style: AppStyles.boldWhiteLabel,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      height: 200,
                      color: AppColors.brightColor,
                      child: ListView(
                        // shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        children: [
                          Text('data1'),
                          Text('data2'),
                          Text('data3'),
                          Text('data4'),
                          Text('data5'),
                          Text('data6'),
                          Text('data7'),
                          Text('data8'),
                          Text('data9'),
                          Text('data0')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0.0,
                child: Container(
                  width: Numbers.deviceWidth <= 415.0
                      ? Numbers.deviceWidth
                      : 415.0,
                  height: 50.0,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withAlpha(50),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
