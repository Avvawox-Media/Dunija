import 'package:dunija/core/database/database_helper.dart';
import 'package:dunija/core/utils/colors.dart';
import 'package:dunija/core/utils/strings.dart';
import 'package:dunija/features/shopping_book/app/bloc/shopping_book_bloc.dart';
import 'package:dunija/features/shopping_book/app/widgets/initial_state_view.dart';
import 'package:dunija/features/shopping_book/app/widgets/shopping_list_item.dart';
import 'package:dunija/features/shopping_book/data/models/shopping_list_model.dart';
import 'package:dunija/features/shopping_book/domain/usecases/get_all_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ShoppingBookView extends StatefulWidget {
  @override
  _ShoppingBookViewState createState() => _ShoppingBookViewState();
}

class _ShoppingBookViewState extends State<ShoppingBookView> {
  DatabaseHelper instance = DatabaseHelper.instance;

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
        create: (context) => ShoppingBookBloc(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.topCenter,
          child: BlocConsumer<ShoppingBookBloc, ShoppingBookState>(
            builder: (context, state) {
              if (state is ShoppingBookInitial) {
                return InitialStateView();
              } else if (state is ShoppingBookLoading) {
                return InitialStateView();
              } else if (state is ShoppingBookLoaded) {
                return ListView(
                  children: state.shoppingList
                      .map(
                        (e) => ShoppingListItem(
                          key: widget.key,
                          title: e.listTitle,
                          subText: e.date.toString(),
                          onEdit: () {},
                          onDelete: () {
                            print(
                              Hive.box(SHOPPING_BOOK).getAt(0),
                            );
                          },
                        ),
                      )
                      .toList(),
                );
              } else {
                return Container();
              }
            },
            listener: (context, state) {},
          ),
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
                  //Test Saving to database
                  await instance.save(
                      SHOPPING_BOOK,
                      ShoppingListModel(
                        date: DateTime.now(),
                        listTitle: 'Okro Soup',
                        items: [
                          {'name': 'Okro', 'description': 'Drawllllllllll'},
                          {'name': 'Pepper', 'description': 'Chillie'},
                        ],
                      ).toJson());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    instance.close(SHOPPING_BOOK);
  }

  void loadShoppingList() {
    BlocProvider.of<ShoppingBookBloc>(context).add(GetAllListEvent());
  }
}
