import 'package:flutter/material.dart';

class AlarmWidget extends StatefulWidget {
  @override
  _AlarmWidgetState createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation rotateAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    rotateAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: -1.0, end: 1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: -1.0), weight: 50),
    ]).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RotationTransition(
        turns: rotateAnimation,
        child: Icon(
          Icons.alarm,
          size: 35.0,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
