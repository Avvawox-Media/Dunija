import 'package:dunija/core/utils/colors.dart';
import 'package:flutter/material.dart';

class MealPlannerView extends StatefulWidget {
  @override
  _MealPlannerViewState createState() => _MealPlannerViewState();
}

class _MealPlannerViewState extends State<MealPlannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text(
          'Planner',
          style: TextStyle(
            color: AppColors.darkAccent.withOpacity(0.5),
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.darkAccent),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(24.0),
              onTap: () {
                // showDialog();
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_box,
                    ),
                    Text(
                      ' Create',
                      style: TextStyle(
                        color: AppColors.darkAccent.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Planner'),
      ),
    );
  }
}
