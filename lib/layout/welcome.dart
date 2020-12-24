import 'package:dunija/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:dunija/routes/bouncypageroute.dart';
import 'package:dunija/layout/auth/login_screen.dart';
import 'package:dunija/layout/auth/signup.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  BuildContext context;

//
  @override
  Widget build(BuildContext context) {
    this.context = context;

    var loginBtn = Container(
      width: 350.0,
      height: 60.0,
      child: RaisedButton(
        elevation: 5.0,
        //color: AppSettings.accentColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        color: AppColors.lightAccent,
        onPressed: () {
          Navigator.push(context, BouncyPageRoute(widget: LoginScreen()));
        },
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: AppColors.lightAccent,
            fontSize: 16.0,
          ),
        ),
      ),
    );

    var signupBtn = Container(
      width: 350.0,
      height: 60.0,
      child: RaisedButton(
        elevation: 5.0,
        //color: Welcome.darkAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        color: AppColors.lightAccent,
        onPressed: () {
          Navigator.push(context, BouncyPageRoute(widget: SignUpScreen()));
        },
        child: Text(
          "REGISTER",
          style: TextStyle(
            color: AppColors.lightAccent,
            fontSize: 16.0,
          ),
        ),
      ),
    );

    //
    return Scaffold(
      body: Stack(children: [
        Container(
          color: AppColors.darkAccent,
        ),
        Positioned(
          child: Image(image: AssetImage('assets/imgs/tl.png')),
        ),
        Positioned(
          child: Image(
            image: AssetImage('assets/imgs/bg_ml.png'),
            fit: BoxFit.contain,
          ),
          top: MediaQuery.of(context).size.height / 2,
        ),
        Positioned(
          child: Image(
            image: AssetImage('assets/imgs/tr.png'),
          ),
          top: 0,
          right: 0,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/imgs/logo_ck.png'),
              ),
              SizedBox(
                height: 200.0,
              ),
              loginBtn,
              SizedBox(
                height: 25.0,
              ),
              signupBtn,
            ],
          ),
        ),
      ]),
    );
  }
}
