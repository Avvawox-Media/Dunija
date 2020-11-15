import 'package:dunija/settings/colors.dart';
import 'package:dunija/settings/quantities.dart';
import 'package:dunija/settings/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDialog {
  static showInfoDialog(
      {@required BuildContext context, @required title, @required msg}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          // Aligns the container to center
          child: Container(
            // A simplified version of dialog.
            width: 150.0,
            // height: 100.0,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    title,
                    style: AppStyles.whiteLabel,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    msg,
                    style: AppStyles.whiteLabel,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Align(
                  child: Container(
                    width: 100.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0, color: AppColors.accentTrans),
                        borderRadius: BorderRadius.circular(
                          Numbers.largeBoxBorderRadius,
                        ),
                      ),
                      color: AppColors.accentTrans,
                      child: Text(
                        'Verify',
                        style: AppStyles.whiteLabel,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static showLoadingDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: Center(
          // Aligns the container to center
          child: Container(
            // A simplified version of dialog.
            width: 100.0,
            height: 100.0,
            // color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  strokeWidth: 1.5,
                ),
                SizedBox(
                  height: Numbers.largeBoxBorderRadius,
                ),
                Text(
                  'Loading',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
