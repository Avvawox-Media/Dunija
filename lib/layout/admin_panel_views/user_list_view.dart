import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/widgets/user_list_item.dart';
import 'package:dunija/models/user.dart';
import 'package:dunija/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class UserListView extends StatelessWidget {
  final Future<List<User>> list;

  UserListView(this.list);
  //
  final TextEditingController _userSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(
          recipeSearchController: _userSearchController,
          hintText: 'Search Users',
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: FutureBuilder(
            future: list,
            builder: (context, AsyncSnapshot<List<User>> snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    children: snapshot.data.map((e) {
                      return UserListItem(
                          name: e.firstName + e.lastName,
                          interest: e.interest,
                          image: Icon(
                            Icons.person,
                            size: 35.0,
                            color: AppColors.darkAccent,
                          ));
                    }).toList());
              }
            },
          ),
        ),
      ],
    );
  }
}
