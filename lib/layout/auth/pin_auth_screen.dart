import 'dart:async';

import 'package:dunija/layout/auth/login_screen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinAuthScreen extends StatefulWidget {
  @override
  _PinAuthScreenState createState() => _PinAuthScreenState();
}

final style = TextStyle(color: AppSettings.bgColor);

class _PinAuthScreenState extends State<PinAuthScreen> {
  //
  var _passwordHidden = true;

  //
  var otpController = TextEditingController();

  var pageName = 'OTP Verification';

  @override
  Widget build(BuildContext context) {
    //
    var otpField = PinPut(
      fieldsCount: 4,
      controller: otpController,
      // obscureText: "\u{02022}",
      // textStyle: TextStyle(fontSize: 30.0, height: 1.0),
      autofocus: true,
      eachFieldConstraints: BoxConstraints(
        maxHeight: 30.0,
        maxWidth: 30.0,
        minHeight: 30.0,
        minWidth: 30.0,
      ),
      selectedFieldDecoration: BoxDecoration(
        border: Border.all(color: AppColors.darkAccent),
        borderRadius: BorderRadius.circular(15.0),
      ).copyWith(),
      followingFieldDecoration: BoxDecoration(
        border: Border.all(color: AppColors.darkAccent),
        borderRadius: BorderRadius.circular(15.0),
      ).copyWith(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: AppColors.darkAccent.withOpacity(1),
        ),
      ),
      submittedFieldDecoration: BoxDecoration(
        border: Border.all(color: AppColors.darkAccent),
        borderRadius: BorderRadius.circular(15.0),
      ).copyWith(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: AppColors.accent.withOpacity(1),
        ),
      ),
    );

    //
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
              fit: BoxFit.fitHeight,
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
          Positioned(
            top: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10.0,
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
          ),
          Positioned(
            top: 150.0,
            child: Padding(
              child: Row(children: [
                Container(child: Text(pageName, style: AppStyles.pageTitle)),
                SizedBox(
                  width: 100.0,
                ),
              ]),
              padding: EdgeInsets.only(left: 20.0),
            ),
          ),
          Positioned(
            bottom: 50.0,
            child: Container(
              width: Numbers.deviceWidth,
              height: Numbers.deviceHeight * (3 / 4) - 80,
              decoration: BoxDecoration(
                color: AppColors.brightColorTrans2,
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
                    height: 50.0,
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
                        'Enter OTP sent to your email',
                        style: AppStyles.catLabel,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),

                  //OTP Field
                  Container(
                      width: Numbers.centerBoxWidth - 50, child: otpField),

                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                      width: Numbers.centerBoxWidth / 2,
                      height: Numbers.buttonHeight,
                      child: FlatButton(
                        onPressed: () {
                          Timer(Duration(seconds: 2), () {});
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
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<bool> _onBackPressed() {}
}
