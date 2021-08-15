import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget widget;

  SlidePageRoute({this.widget})
      : super(
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child,
            ) {
              animation = CurvedAnimation(
                parent: animation,
                curve: Curves.linear,
              );

              return ScaleTransition(
                alignment: Alignment.bottomCenter,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> setAnimation,
            ) {
              return widget;
            });
}
