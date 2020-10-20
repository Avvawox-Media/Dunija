import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:dunija/screens/dashboard.dart';
import 'package:dunija/screens/login.dart';
import 'package:dunija/routes/slidepageroute.dart';
import 'package:dunija/routes/bouncypageroute.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

final style = TextStyle(color: AppSettings.bgColor);

class _SignUpScreenState extends State<SignUpScreen> {
  //
  var _passwordHidden = true;

  //
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

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

    //First Name TextField Object
    var fullName = TextField(
      obscureText: false,
      controller: nameController,
      textAlign: TextAlign.start,
      style: textStyle,
      decoration: InputDecoration(
        hintText: "Full Name",
        prefixIcon: Icon(Icons.account_box),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        contentPadding: EdgeInsets.all(15.0),
      ),
      textCapitalization: TextCapitalization.words,
      autocorrect: false,
    );

    //Create Phone TextField Object
    var email = TextField(
      obscureText: false,
      controller: emailController,
      textAlign: TextAlign.start,
      style: textStyle,
      decoration: InputDecoration(
        hintText: "Email",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        contentPadding: EdgeInsets.all(15.0),
      ),
      textInputAction: TextInputAction.done,
    );

    //Create PasswordField Object
    var password = TextField(
      obscureText: _passwordHidden,
      controller: passwordController,
      textAlign: TextAlign.start,
      style: textStyle,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        contentPadding: EdgeInsets.all(15.0),
        suffixIcon: InkWell(
          child: _passwordHidden
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
          onTap: togglePasswordVisibility,
        ),
      ),
      textInputAction: TextInputAction.send,
    );

    var signupBtn = SizedBox(
      width: 180.0,
      height: 50.0,
      child: RaisedButton(
        //elevation: 5.0,
        //color: Welcome.darkAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        color: AppSettings.primaryColor,
        onPressed: () {
          Navigator.push(context, BouncyPageRoute(widget: Dashboard()));
        },
        child: Text(
          "JOIN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );

    var termsText = GestureDetector(
      child: Text(
        "Terms of Use",
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {},
    );
    var privacyText = GestureDetector(
      child: Text(
        "Privacy Policy",
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
      onTap: () {},
    );

    final loginLink = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already an Adventurer? '),
        GestureDetector(
          child: Text(
            "Login",
            style: TextStyle(
              color: AppSettings.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(context, SlidePageRoute(widget: LoginScreen()));
          },
        )
      ],
    );

    //
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppSettings.primaryColor,
          ),
          Image(
            image: AssetImage('assets/imgs/bg_ml.png'),
            fit: BoxFit.contain,
          ),
          Positioned(
            child: Image(
              image: AssetImage('assets/imgs/tl.png'),
            ),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: Image(
              image: AssetImage('assets/imgs/tr.png'),
            ),
            top: 0,
            right: 0,
          ),
          Positioned(
            child: Image(
              image: AssetImage('assets/imgs/br.png'),
            ),
            bottom: 0,
            right: 0,
          ),
          Positioned(
            child: Image(
              image: AssetImage('assets/imgs/random.png'),
            ),
            bottom: 150.0,
            right: 50.0,
          ),
          Stack(
            //fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image(
                image: AssetImage('assets/imgs/transp.png'),
                height: 500.0,
              ),
              Container(
                width: 300.0,
                height: 400.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.0,
                    ),
                    Text(
                      'Join the Adventure',
                      style: TextStyle(
                          fontFamily: 'Amplify',
                          fontSize: 36.0,
                          color: AppSettings.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    fullName,
                    SizedBox(
                      height: 10.0,
                    ),
                    email,
                    SizedBox(
                      height: 10.0,
                    ),
                    password,
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'By clicking \'JOIN\', you agree to these',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [termsText, Text(' and '), privacyText],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    signupBtn,
                    SizedBox(
                      height: 15.0,
                    ),
                    loginLink,
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
