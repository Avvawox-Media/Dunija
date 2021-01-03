import 'package:dunija/models/recipe.dart';
import 'package:dunija/widgets/admin_recipe_list_item.dart';
import 'package:dunija/utils/custom_icon_icons.dart';
import 'package:dunija/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class AdminRecipeListView extends StatelessWidget {
  final Future<List<Recipe>> list;

  AdminRecipeListView(this.list);
  //
  final TextEditingController _recipeSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(
          recipeSearchController: _recipeSearchController,
          hintText: 'Search Recipes',
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: FutureBuilder(
            future: list,
            builder: (context, AsyncSnapshot<List<Recipe>> snapshot) {
              if (snapshot.hasError)
                return Container(
                  alignment: Alignment.center,
                  child: Text('Something went wrong'),
                );
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.all(0.0),
                  children: snapshot.data.map((data) {
                    return AdminRecipeListItem(
                        title: data.name,
                        category: data.description,
                        image: Icon(CustomIcon.food));
                  }).toList(),
                );
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
