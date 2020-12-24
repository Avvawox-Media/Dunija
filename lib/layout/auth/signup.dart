import 'package:dunija/layout/auth/login_screen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:dunija/widgets/interest_dropdown.dart';
import 'package:dunija/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dunija/routes/slidepageroute.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  var pageName = 'Register';

  @override
  Widget build(BuildContext context) {
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
                      Image(
                        image: AssetImage('assets/imgs/dunija.png'),
                        width: 120.0,
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
                        //Top Login Button
                        Container(
                          height: 40.0,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Numbers.largeBoxBorderRadius),
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.popUntil(
                                  context, ModalRoute.withName('/Login'));
                            },
                            child: Text(
                              'Login',
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
                      height: 30.0,
                    ),
                    Text(
                      'Join the Adventure',
                      style: AppStyles.cursiveTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 0.0),
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            //Full Name Textfield
                            Align(
                              child: Container(
                                width: Numbers.centerBoxWidth,
                                height: Numbers.buttonHeight,
                                child: CustomeTextField(
                                  controller: nameController,
                                  hint: 'Full Name',
                                  icon: Icons.person,
                                  hidden: false,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10.0,
                            ),

                            //Email Textfield
                            Align(
                              child: Container(
                                width: Numbers.centerBoxWidth,
                                height: Numbers.buttonHeight,
                                child: CustomeTextField(
                                  controller: emailController,
                                  hint: 'Email',
                                  icon: Icons.email,
                                  hidden: false,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10.0,
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
                              height: 10.0,
                            ),

                            //Interest Textfield
                            Align(
                              child: Container(
                                width: Numbers.centerBoxWidth,
                                height: Numbers.buttonHeight,
                                child: InterestsDropdown(),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),

                            //Terms of Service and Privacy Policy
                            Align(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                width: Numbers.centerBoxWidth,
                                alignment: Alignment.center,
                                child: Column(children: [
                                  Text(
                                    'By signing up, you agree to our',
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Text(
                                          'Terms of Service',
                                          style: AppStyles.boldBrownSmallLabel,
                                        ),
                                      ),
                                      Text(' & '),
                                      InkWell(
                                        child: Text(
                                          'Privacy Policy',
                                          style: AppStyles.boldBrownSmallLabel,
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),

                            //Register Button
                            Align(
                              child: Container(
                                  width: Numbers.centerBoxWidth / 2,
                                  height: Numbers.buttonHeight,
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Register',
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
                                Text('Already in? '),
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
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
