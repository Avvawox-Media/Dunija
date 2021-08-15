import 'package:dunija/features/auth/app/pages/recovery_screen.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/quantities.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:dunija/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:dunija/features/auth/app/pages/signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  var pageName = 'Login';

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
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
                    padding: EdgeInsets.only(
                        top: 15.0, left: 20.0, right: 15.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(pageName, style: AppStyles.pageTitle),
                        ),
                        Container(
                          height: 40.0,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Numbers.largeBoxBorderRadius),
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignUpScreen();
                                  },
                                  settings: RouteSettings(name: '/Register'),
                                ),
                              );
                            },
                            child: Text(
                              'Register',
                              style: AppStyles.setTextStyle(color: 0xFFFFFFFF),
                            ),
                            color: AppColors.darkAccent.withOpacity(0.4),
                            elevation: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

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
                      'Welcome',
                      style: AppStyles.cursiveTitle,
                      textAlign: TextAlign.center,
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
                            height: 20.0,
                          ),

                          //Password Textfield
                          Align(
                            child: Container(
                              width: Numbers.centerBoxWidth,
                              height: Numbers.buttonHeight,
                              child: CustomeTextField(
                                controller: passwordController,
                                hint: 'Password',
                                icon: Icons.lock,
                                hidden: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),

                          Align(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              width: Numbers.centerBoxWidth,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                child: Text(
                                  'Forgot Password',
                                  style: AppStyles.setTextStyle(
                                      weight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) {
                                            return RecoveryScreen();
                                          },
                                          settings: RouteSettings(
                                              name: '/Recovery')));
                                },
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
                                  onPressed: () {},
                                  child: Text(
                                    'Login',
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
                              Text('Not in yet? '),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) {
                                            return SignUpScreen();
                                          },
                                          settings: RouteSettings(
                                              name: '/Register')));
                                },
                                child: Text(
                                  'Join the adventure',
                                  style: AppStyles.boldBrownLabel,
                                ),
                              )
                            ],
                          ),
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
