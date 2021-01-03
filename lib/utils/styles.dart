import 'package:dunija/utils/colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  ///TextStyles
  static final catLabel = TextStyle(
    color: AppColors.brightColor,
    fontWeight: FontWeight.bold,
  );

  ///TextStyles
  static final catBigLabel = TextStyle(
    color: AppColors.brightColor,
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
  );

  static final boldBrownLabel = TextStyle(
    color: AppColors.darkAccent,
    fontWeight: FontWeight.bold,
  );

  static final boldBrownSmallLabel = TextStyle(
    color: AppColors.darkAccent,
    fontWeight: FontWeight.bold,
    fontSize: 13.0,
  );

  static final pageTitle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static final titleStyle = TextStyle(
    color: AppColors.darkAccent,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static final favItemDesc = TextStyle(
    color: AppColors.blackColor,
    fontSize: 13.0,
    fontWeight: FontWeight.normal,
  );

  static final greyLabel = TextStyle(
    color: Colors.grey,
    fontSize: 13.0,
    fontWeight: FontWeight.normal,
  );

  static final whiteTitleLabel = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static final whiteBodyLabel = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );
  static final whiteLabel = TextStyle(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
  );

  static final boldWhiteLabel = TextStyle(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
  static final boldTimerLabel = TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  );
  static final textFieldLabel = TextStyle(
    color: AppColors.darkAccent,
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  );

  static final cursiveTitle = TextStyle(
    color: AppColors.darkAccent,
    fontSize: 36.0,
    fontFamily: 'Amplify',
    fontWeight: FontWeight.normal,
  );

  static setTextStyle(
      {String font,
      double size,
      int color,
      FontWeight weight,
      FontStyle style}) {
    return TextStyle(
      fontFamily: font?.toString(),
      fontSize: size?.toDouble(),
      color: color == null ? AppColors.darkAccent : Color(color),
      fontWeight: weight == null ? FontWeight.normal : weight,
      fontStyle: style == null ? FontStyle.normal : style,
    );
  }
}
