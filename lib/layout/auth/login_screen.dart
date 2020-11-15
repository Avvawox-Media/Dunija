import 'package:dunija/layout/auth/recovery_screen.dart';
import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:dunija/widgets/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:dunija/layout/auth/signup.dart';
import 'package:dunija/routes/slidepageroute.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final style = TextStyle(color: AppSettings.bgColor);

class _LoginScreenState extends State<LoginScreen> {
  //
  var _passwordHidden = true;

  //
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  var pageName = 'Login';

  @override
  Widget build(BuildContext context) {
    //
    void togglePasswordVisibility() {
      setState(() {
        _passwordHidden = !_passwordHidden;
      });
    }

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
        Positioned(
          top: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.0,
              ),
              Column(children: [
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ]),
              SizedBox(
                width: 5.0,
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
                  'Welcome',
                  style: AppStyles.cursiveTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),

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
                        style: AppStyles.catLabel,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RecoveryScreen();
                        }));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    width: Numbers.centerBoxWidth / 2,
                    height: Numbers.buttonHeight,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: AppStyles.whiteLabel,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Numbers.inputBorderRadius)),
                      color: AppColors.darkAccent,
                    )),

                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not in yet? '),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: Text(
                        'Join the adventure',
                        style: AppStyles.boldBrownLabel,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
