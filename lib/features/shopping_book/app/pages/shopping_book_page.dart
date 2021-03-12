import 'package:dunija/core/database/database_helper.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/features/shopping_book/app/bloc/shopping_book_bloc.dart';
import 'package:dunija/features/shopping_book/app/pages/expanded_shopping_list_page.dart';
import 'package:dunija/features/shopping_book/app/widgets/initial_state_view.dart';
import 'package:dunija/features/shopping_book/app/widgets/shopping_list_item.dart';
import 'package:dunija/features/shopping_book/data/models/shopping_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../injection_container.dart';

class ShoppingBookPage extends StatefulWidget {
  @override
  _ShoppingBookPageState createState() => _ShoppingBookPageState();
}

class _ShoppingBookPageState extends State<ShoppingBookPage> {
  DatabaseHelper instance = DatabaseHelper.instance;

  //Shopping List Bloc
  final shoppingListBloc = sl<ShoppingBookBloc>();

  @override
  void initState() {
    super.initState();
    instance.open(SHOPPING_BOOK);
  }

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
          'Shopping Book',
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
                showDialog();
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
      body: BlocProvider<ShoppingBookBloc>(
        create: (context) => shoppingListBloc..add(GetAllListEvent()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          child: BlocConsumer<ShoppingBookBloc, ShoppingBookState>(
              listener: (context, state) async {},
              builder: (context, state) {
                if (state is ShoppingBookLoaded) {
                  return ListView.builder(
                    itemCount: state.shoppingList.length,
                    itemBuilder: (context, index) {
                      return ShoppingListItem(
                        key: Key('key'),
                        title: state.shoppingList.elementAt(index).listTitle,
                        subText: state.shoppingList.elementAt(index).date,
                        onEdit: () {},
                        onDelete: () {
                          shoppingListBloc.add(RemoveListEvent(index));
                          shoppingListBloc.add(GetAllListEvent());
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExpandedShoppingListPage(
                                shoppingList:
                                    state.shoppingList.elementAt(index),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }

  void showDialog() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 5.0,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height - 200.0,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Title'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                child: Text('Create List'),
                onPressed: () async {
                  DateTime dateTime = DateTime.now();
                  final now = '${dateTime.day}-${dateTime.month}-' +
                      '${dateTime.year} \t ${timeIn12(dateTime)}';
                  //Test Saving to database
                  await instance.save(
                    SHOPPING_BOOK,
                    ShoppingListModel(
                      date: now,
                      listTitle: 'Okro Soup',
                      items: [
                        {'name': 'Okro', 'description': 'Drawllllllllll'},
                        {'name': 'Pepper', 'description': 'Chillie'},
                      ],
                    ).toJson(),
                  );

                  shoppingListBloc.add(GetAllListEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String timeIn12(DateTime value) {
    if (value.hour > 12) {
      final hour = value.hour - 12;
      final minute = value.minute;

      return '$hour:$minute';
    } else {
      final hour = value.hour;
      final minute = value.minute;

      return '$hour:${minute}PM';
    }
  }

  @override
  void dispose() {
    super.dispose();

    instance.close(SHOPPING_BOOK);
    shoppingListBloc.close();
  }
}
