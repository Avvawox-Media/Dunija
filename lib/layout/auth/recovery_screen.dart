import 'dart:async';

import 'package:dunija/layout/auth/login_screen.dart';
import 'package:dunija/layout/auth/pin_auth_screen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:dunija/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:dunija/settings/Appsettings.dart';

class RecoveryScreen extends StatefulWidget {
  @override
  _RecoveryScreenState createState() => _RecoveryScreenState();
}

final style = TextStyle(color: AppSettings.bgColor);

class _RecoveryScreenState extends State<RecoveryScreen> {
  //
  var _passwordHidden = true;

  //
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  var pageName = 'Password Recovery';

  @override
  Widget build(BuildContext context) {
    //
    void togglePasswordVisibility() {
      setState(() {
        _passwordHidden = !_passwordHidden;
      });
    }

    //TextField TextStyle
    final textStyle = TextStyle(
      fontSize: 18.0,
      color: AppSettings.primaryOrange,
    );

    //Button TextStyle
    final btnTextStyle = TextStyle(
      fontSize: 18.0,
      color: AppSettings.primaryOrange,
    );

    //
    return Scaffold(
      body: Stack(children: [
        Container(
          color: AppColors.accent,
          width: Numbers.deviceWidth,
          height: Numbers.deviceHeight,
        ),
        Positioned(
          top: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/dunija_bg.png'),
            fit: BoxFit.fill,
            width: Numbers.deviceWidth,
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Positioned(
          top: 0.0,
          right: -50.0,
          child: Image(
            image: AssetImage('assets/imgs/top_right.png'),
            width: 200.0,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.whiteColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
                    SizedBox(
                      width: 0.0,
                    ),
                    Image(
                      image: AssetImage('assets/imgs/dunija.png'),
                      width: 120.0,
                    ),
                    SizedBox(
                      width: Numbers.deviceWidth - 230,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
                Padding(
                  child: Row(children: [
                    Container(
                        child: Text(pageName, style: AppStyles.pageTitle)),
                    SizedBox(
                      width: 100.0,
                    ),
                  ]),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                ),
              ],
            )),

            //Bottom Section
            Expanded(
              child: Container(
                width: Numbers.deviceWidth,
                decoration: BoxDecoration(
                  color: AppColors.brightColor.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x33000000),
                        spreadRadius: 1.0,
                        blurRadius: 15.0)
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Change Password',
                      style: AppStyles.cursiveTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        width: Numbers.centerBoxWidth,
                        alignment: Alignment.center,
                        child: Text(
                          'Enter your email to recover account',
                          style: AppStyles.setTextStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          //Email Textfield
                          Align(
                            child: Container(
                              width: Numbers.centerBoxWidth,
                              height: Numbers.buttonHeight,
                              child: CustomeTextField(
                                controller: emailController,
                                hint: 'Email',
                                icon: Icons.person,
                                hidden: false,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30.0,
                          ),
                          Align(
                            child: Container(
                                width: Numbers.centerBoxWidth / 2,
                                height: Numbers.buttonHeight,
                                child: FlatButton(
                                  onPressed: () {
                                    Timer(Duration(seconds: 2), () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PinAuthScreen();
                                      }));
                                    });
                                  },
                                  child: Text(
                                    'Submit',
                                    style: AppStyles.whiteLabel,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Numbers.inputBorderRadius)),
                                  color: AppColors.darkAccent,
                                )),
                          ),

                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Remembered your Password? '),
                              InkWell(
                                onTap: () {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/Login'));
                                },
                                child: Text(
                                  'Login',
                                  style: AppStyles.boldBrownLabel,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
