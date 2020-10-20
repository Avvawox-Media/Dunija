import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dunija/settings/Appsettings.dart';
import 'package:dunija/screens/dashboard.dart';
import 'package:dunija/screens/signup.dart';
import 'package:dunija/routes/slidepageroute.dart';
import 'package:dunija/routes/bouncypageroute.dart';

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

    //Create Phone TextField Object
    var email = TextFormField(
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
    var password = TextFormField(
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

    var loginBtn = SizedBox(
      width: 180.0,
      height: 50.0,
      child: RaisedButton(
        //elevation: 5.0,
        //color: Welcome.darkAccent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        color: AppSettings.primaryOrange,
        onPressed: () {
          Navigator.push(context, BouncyPageRoute(widget: Dashboard()));
        },
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );

    final signUpLink = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Not an Adventurer yet? '),
        GestureDetector(
          child: Text(
            "Join",
            style: TextStyle(
              color: AppSettings.primaryOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(context, SlidePageRoute(widget: SignUpScreen()));
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
          Stack(
            //fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image(
                image: AssetImage('assets/imgs/transp.png'),
              ),
              Container(
                width: 300.0,
                height: 350.0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.0,
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontFamily: 'Amplify',
                          fontSize: 24.0,
                          color: AppSettings.primaryOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    email,
                    SizedBox(
                      height: 25.0,
                    ),
                    password,
                    SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    loginBtn,
                    SizedBox(
                      height: 25.0,
                    ),
                    signUpLink,
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
