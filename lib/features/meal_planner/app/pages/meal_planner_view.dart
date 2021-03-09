import 'package:flutter/material.dart';

class MealPlannerView extends StatefulWidget {
  @override
  _MealPlannerViewState createState() => _MealPlannerViewState();
}

class _MealPlannerViewState extends State<MealPlannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Planner'),
      ),
    );
  }
}
