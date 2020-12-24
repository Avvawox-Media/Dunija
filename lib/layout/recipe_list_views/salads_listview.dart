import 'package:dunija/models/recipe.dart';
import 'package:dunija/widgets/recipe_list_item.dart';
import 'package:dunija/utils/custom_icon_icons.dart';
import 'package:dunija/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class SaladsListView extends StatelessWidget {
  final Future<List<Recipe>> list;

  SaladsListView(this.list);
  //
  final TextEditingController _recipeSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(recipeSearchController: _recipeSearchController),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: FutureBuilder(
            future: list,
            builder: (context, AsyncSnapshot<List<Recipe>> snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    children: snapshot.data.map((e) {
                      return RecipeListItem(
                          title: e.name,
                          category: e.description,
                          image: Icon(CustomIcon.food));
                    }).toList());
              }
            },
          ),
        ),
      ],
    );
  }
}
