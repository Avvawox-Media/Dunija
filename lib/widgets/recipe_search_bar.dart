import 'package:dunija/utils/colors.dart';
import 'package:dunija/utils/quantities.dart';
import 'package:flutter/material.dart';

class RecipeSearchBar extends StatefulWidget {
  final recipeSearchController;

  RecipeSearchBar({@required this.recipeSearchController});
  @override
  _RecipeSearchBarState createState() => _RecipeSearchBarState();
}

class _RecipeSearchBarState extends State<RecipeSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40.0,
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: TextField(
        cursorColor: AppColors.darkAccent,
        controller: widget.recipeSearchController,
        maxLines: 1,
        style: TextStyle(fontSize: 14.0, height: 0.8),
        autocorrect: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.all(10.0),
          hintText: 'Search Recipes',
          fillColor: AppColors.accent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Numbers.largeBoxBorderRadius,
            ),
            borderSide: BorderSide(color: AppColors.accent),
          ),
        ),
      ),
    );
  }
}
