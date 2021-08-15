import 'package:dunija/features/auth/app/pages/login_screen.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/quantities.dart';
import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/core/utils/styles.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    Numbers.deviceHeight = MediaQuery.of(context).size.height;
    Numbers.deviceWidth = MediaQuery.of(context).size.width;

    final pageName = AppStrings.account;

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
          top: 120.0,
          child: Padding(
            child: Row(children: [
              Container(child: Text(pageName, style: AppStyles.pageTitle)),
              SizedBox(
                width: 100.0,
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  color: AppColors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Numbers.largeBoxBorderRadius),
                    side: BorderSide(width: 1, color: AppColors.whiteColor),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock,
                        color: AppColors.whiteColor,
                        size: 15.0,
                      ),
                      Text(
                        ' Login',
                        style: AppStyles.whiteLabel,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            padding: EdgeInsets.only(left: 20.0),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            width: Numbers.deviceWidth,
            height: Numbers.deviceHeight * (3 / 4),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: Color(0x33000000),
                    spreadRadius: 1.0,
                    blurRadius: 15.0)
              ],
            ),
            child: showUserData(),
          ),
        ),
      ]),
    );
  }

  Widget showUserData() {
    return GestureDetector(
      child: ListView(
        children: [
          Column(
            children: [
              buildUsernameItem(name: 'User', badge: 'None'),
              buildOtherItem(
                  bio: 'Bio',
                  dob: '22 May, 2020',
                  gender: 'Female',
                  interest: 'African Dishes')
            ],
          )
        ],
      ),
    );
  }

  Widget buildUsernameItem({@required name, @required badge}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      constraints: BoxConstraints(minHeight: 120.0, maxWidth: 350.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: Offset(0, 1),
            spreadRadius: 1.0,
          )
        ],
        color: AppColors.whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accent,
            radius: 30.0,
            child: Icon(
              Icons.person,
              color: AppColors.brightColor,
            ),
          ),
          Spacer(
              // width: 15.0,
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Edit User Profile
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * (0.65),
                child: Container(
                  width: 80.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            Numbers.mediumBoxBorderRadius)),
                    onPressed: () {},
                    color: Colors.grey.shade200,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 16,
                          ),
                          Text(' Edit'),
                        ]),
                  ),
                ),
              ),
              Text(
                name,
                style: AppStyles.titleStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(children: [
                Text(
                  'Badge: ',
                  style: AppStyles.greyLabel,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * (0.6)),
                  child: Text(
                    badge,
                    textAlign: TextAlign.justify,
                    style: AppStyles.favItemDesc,
                  ),
                ),
              ]),
            ],
          )
        ],
      ),
    );
  }

  Widget buildOtherItem(
      {@required bio, @required gender, @required dob, @required interest}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        constraints: BoxConstraints(minHeight: 120.0, maxWidth: 350.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Numbers.smallBoxBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: Offset(0, 1),
              spreadRadius: 1.0,
            )
          ],
          color: AppColors.whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Edit User Profile
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              child: Container(
                width: 80.0,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Numbers.mediumBoxBorderRadius)),
                  onPressed: () {},
                  color: Colors.grey.shade200,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 16,
                        ),
                        Text(' Edit'),
                      ]),
                ),
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            Container(
              width: Numbers.deviceWidth,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Numbers.smallBoxBorderRadius),
                  color: Colors.grey.shade100),
              child: Row(children: [
                Text(
                  'Bio: ',
                  style: AppStyles.greyLabel,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Text(
                    bio,
                    textAlign: TextAlign.justify,
                    style: AppStyles.favItemDesc,
                  ),
                ),
              ]),
            ),
            //Gender
            Container(
              width: Numbers.deviceWidth,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Numbers.smallBoxBorderRadius),
                  color: Colors.grey.shade100),
              child: Row(children: [
                Text(
                  'Gender: ',
                  style: AppStyles.greyLabel,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Text(
                    gender,
                    textAlign: TextAlign.justify,
                    style: AppStyles.favItemDesc,
                  ),
                ),
              ]),
            ),
            //Date of Birth
            Container(
              width: Numbers.deviceWidth,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Numbers.smallBoxBorderRadius),
                  color: Colors.grey.shade100),
              child: Row(children: [
                Text(
                  'Date of Birth: ',
                  style: AppStyles.greyLabel,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Text(
                    dob,
                    textAlign: TextAlign.justify,
                    style: AppStyles.favItemDesc,
                  ),
                ),
              ]),
            ),
            //Interest
            Container(
              width: Numbers.deviceWidth,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              margin: EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Numbers.smallBoxBorderRadius),
                  color: Colors.grey.shade100),
              child: Row(children: [
                Text(
                  'Interest: ',
                  style: AppStyles.greyLabel,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: Text(
                    interest,
                    textAlign: TextAlign.justify,
                    style: AppStyles.favItemDesc,
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
