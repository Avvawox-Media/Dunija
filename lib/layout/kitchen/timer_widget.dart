import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerWidget extends StatelessWidget {
  final duration;

  TimerWidget({this.duration});

  @override
  Widget build(BuildContext context) {
    return Countdown(
        controller: CountdownController(),
        seconds: duration * 60,
        build: (context, time) {
          return Row(
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
          );
        });
  }
}
