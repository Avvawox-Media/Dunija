import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerWidget extends StatelessWidget {
  final duration;

  TimerWidget({this.duration});

  @override
  Widget build(BuildContext context) {
    return createNewCountdown();
  }

  Widget createNewCountdown() {
    return Countdown(
      controller: CountdownController(),
      seconds: duration * 60,
      build: (context, time) {
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///////////////////////////////////////
              /// Progress Bar Widget
              ///////////////////////////////////////
              buildProgressBar(time),

              SizedBox(
                width: 10.0,
              ),

              ///////////////////////////////////////
              /// Count-down Time
              ///////////////////////////////////////
              Container(
                alignment: Alignment.center,
                width: 0.22 * Numbers.deviceWidth,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.darkAccent,
                        AppColors.accent.withBlue(20).withRed(80).withGreen(20),
                      ]),
                  borderRadius: BorderRadius.circular(
                    Numbers.smallBoxBorderRadius,
                  ),
                  border: Border.all(
                      width: 0.5, color: AppColors.brightColorTrans2),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.alarm,
                      color: AppColors.brightColor,
                      size: 18.0,
                    ),
                    Text(
                      (' '),
                      style: AppStyles.boldTimerLabel,
                    ),
                    Text(
                      (time ~/ 60).toString().padLeft(2, '0'),
                      style: AppStyles.boldTimerLabel,
                    ),
                    Text(
                      (':'),
                      style: AppStyles.boldTimerLabel,
                    ),
                    Text(
                      (time % 60).toInt().toString().padLeft(2, '0'),
                      style: AppStyles.boldTimerLabel,
                    ),
                  ],
                ),
              ),
            ]);
      },
    );
  }

  Widget buildProgressBar(timer) {
    double count = (duration * 60) - timer;

    ////////////////////////////////////////////
    /// Progress Bar
    ////////////////////////////////////////////
    var progressBar = Container(
      width: (Numbers.deviceWidth - 150) * count / (duration * 60),
      height: Numbers.deviceWidth > 500 ? 23.0 : 18.0,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.darkAccent.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0))
        ],
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.accent,
              AppColors.whiteColor,
            ]),
        // border: Border.all(color: AppColors.lightAccent, width: 2.0),
        borderRadius: BorderRadius.circular(
          Numbers.largeBoxBorderRadius,
        ),
        image: DecorationImage(
          image: AssetImage('assets/imgs/progress.png'),
          fit: BoxFit.fitHeight,
          repeat: ImageRepeat.repeatX,
        ),
      ),
    );

    return Container(
      alignment: Alignment.centerLeft,
      height: Numbers.deviceWidth > 500 ? 20.0 : 20.0,
      width: Numbers.deviceWidth * 0.60,
      decoration: BoxDecoration(
        border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.lightAccent,
            width: 2.50),
        borderRadius: BorderRadius.circular(Numbers.largeBoxBorderRadius),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [AppColors.lightAccent, AppColors.accent],
        ),
      ),
      child: progressBar,
      clipBehavior: Clip.hardEdge,
    );
  }
}
